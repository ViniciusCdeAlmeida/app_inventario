import 'dart:io';
import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/main.dart';

import 'package:app_inventario/helpers/helper_dadosBemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_estruturaInventario.dart';

import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/serialized/estruturaInventario.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventario> _estruturas = [];
  List<EstruturaInventario> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstruturaFiltrado = [];
  int _idUlAtual;
  BemPatrimonial _bemPatrimonial;
  String _quantidadeDigitos;
  String _digitoVerificador;

  String _nomeEstrutura;
  bool _isLoadingEstruturas = false;
  bool _isLoadingBens = false;

  bool get isLoadingEstruturas => _isLoadingEstruturas;
  bool get isLoadingBens => _isLoadingBens;

  List<EstruturaInventario> get getLevantamentos {
    return _estruturas;
  }

  int get getUlAtual {
    return _idUlAtual;
  }

  List<EstruturaInventario> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return _bensEstruturaFiltrado.length != 0 &&
            _bensEstruturaFiltrado.length < [..._bensEstrutura].length
        ? _bensEstruturaFiltrado
        : [..._bensEstrutura];
  }

  BemPatrimonial get getBemPatrimonial {
    return _bemPatrimonial;
  }

  String get getNomeEstrutura {
    return _nomeEstrutura;
  }

  String get getDigitosLeitura {
    return _quantidadeDigitos;
  }

  String get getDigitoVerificador {
    return _digitoVerificador;
  }

  void setUlAtual(int id) {
    _idUlAtual = id;
  }

  void setDigitosLeitura(String digitos) {
    _quantidadeDigitos = digitos;
  }

  void setDigitoVerificador(String digito) {
    _digitoVerificador = digito;
  }

  Future<void> buscaBensPorEstrutura(
      int id, String idInventarioEstrutura) async {
    _isLoadingBens = false;
    _bensEstrutura = helperDadosBemPatrimonialLista(
        await db.dadosBemPatrimoniaisDao.getAllDadosPorEstrutura(id));
    List<DadosBensPatrimoniais> inventariadoForaEspelho =
        helperDadosBemPatrimonialForaEspelhoLista(
            await db.inventarioBemPatrimonialDao
                .getInventariadosForaEspelho(idInventarioEstrutura),
            int.parse(idInventarioEstrutura));
    _bensEstrutura.addAll(inventariadoForaEspelho);
    _isLoadingBens = true;
    notifyListeners();
  }

  void limpaFiltrados() {
    _bensEstruturaFiltrado.clear();
    notifyListeners();
  }

  void filtraBens(String value) async {
    _bensEstruturaFiltrado = _bensEstrutura.where(
      (element) {
        if (element.numeroPatrimonial != null && element.material != null) {
          return element.numeroPatrimonial.contains(value.toUpperCase()) ||
              element.material.descricao.contains(value.toUpperCase()) ||
              element.material.codigoEDescricao.contains(value.toUpperCase());
        } else if (element.numeroPatrimonial == null &&
            element.material != null) {
          return element.material.descricao.contains(value.toUpperCase()) ||
              element.material.codigoEDescricao.contains(value.toUpperCase()) ||
              element.inventarioBemPatrimonial.numeroPatrimonial
                  .contains(value.toUpperCase());
        } else if (element.numeroPatrimonial != null &&
            element.material == null) {
          return element.numeroPatrimonial.contains(value.toUpperCase());
        } else if (element.numeroPatrimonial == null &&
            element.material != null) {
          return element.numeroPatrimonialCompleto
              .contains(value.toUpperCase());
        }
      },
    ).toList();
    notifyListeners();
  }

  Future<void> buscaPorEstrutura(int id) async {
    _levantamentosEstrutura = helperEstruturaInventarioLista(
        await db.estruturaInventarioDao.getAllEstruturasPorLevantamento(id));

    notifyListeners();
  }

  Future<BemPatrimonial> buscaBensPorId(String numeroBemPatrimonial) async {
    _isLoadingBens = false;
    _bemPatrimonial = helperDadoBemPatrimonial2(await db.bemPatrimoniaisDao
        .getBemPatrimonial(numeroBemPatrimonial.toUpperCase()));
    _bemPatrimonial.dadosBensPatrimoniais = helperDadoBemPatrimonial(await db
        .dadosBemPatrimoniaisDao
        .getDadosInventariar(numeroBemPatrimonial.toUpperCase()));
    _isLoadingBens = true;
    notifyListeners();
    return _bemPatrimonial;
  }

  Future<void> atualizaItemInventariado(int id) async {
    await db.dadosBemPatrimoniaisDao.updateDadosBemPatrimonial(id);
    await db.bemPatrimoniaisDao.updateBemPatrimonial(id);
    if (_bensEstruturaFiltrado.isNotEmpty) {
      final idx = _bensEstruturaFiltrado
          .indexWhere((value) => value.idBemPatrimonial == id);
      if (idx >= 0) {
        _bensEstruturaFiltrado[idx].inventariado = true;
      }
    } else {
      final idx =
          _bensEstrutura.indexWhere((value) => value.idBemPatrimonial == id);
      if (idx >= 0) {
        _bensEstrutura[idx].inventariado = true;
      }
    }
    notifyListeners();
  }

  Future<void> _getLevantamento(String conexao, int idLevantamento) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      final filter = {
        "start": 1,
        "dir": "asc",
        "sort": "id",
        "limit": 1000000,
        "filters": [
          {
            "type": "numeric",
            "field": "inventario.id",
            "value": idLevantamento,
          },
        ],
      };
      Response response = await dio
          .post("obterInventarioEstruturaOrganizacionalPorDemandaV2.json",
              data: filter)
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });

      _nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];

      notifyListeners();
      await db.estruturaInventarioDao
          .insertEstruturaInventario((response.data["objects"] as List));
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoadingEstruturas = true;
    notifyListeners();
  }

  void atualizaDados(BemPatrimonial item) {
    final idx = _bensEstrutura.indexWhere((value) => value.id == item.id);
    if (idx >= 0) {
      _bensEstrutura[idx].inventariado = true;
      notifyListeners();
    }
  }

  Future<void> buscaEstruturas(
      String conexao, List<Levantamento> listLevantamento) async {
    _estruturas.clear();
    markAsLoading();

    db.deleteTable(db.estruturaInventarioDB);
    db.deleteTable(db.dadosBemPatrimoniaisDB);
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList()
        .whenComplete(
      () {
        _nomeEstrutura = null;
        _isLoadingEstruturas = false;
        notifyListeners();
      },
    );
  }
}
