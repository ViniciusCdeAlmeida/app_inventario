import 'dart:io';
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
  DadosBensPatrimoniais _bemPatrimonial;
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

  List<EstruturaInventario> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return [..._bensEstrutura];
  }

  DadosBensPatrimoniais get getBemPatrimonial {
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

  void setDigitosLeitura(String digitos) {
    _quantidadeDigitos = digitos;
  }

  void setDigitoVerificador(String digito) {
    _digitoVerificador = digito;
  }

  Future<void> buscaBensPorEstrutura(int id) async {
    _bensEstrutura = helperDadosBemPatrimonialLista(
        await db.dadosBemPatrimoniaisDao.getAllDadosPorEstrutura(id));

    notifyListeners();
  }

  Future<void> buscaPorEstrutura(int id) async {
    _levantamentosEstrutura = helperEstruturaInventarioLista(
        await db.estruturaInventarioDao.getAllEstruturasPorLevantamento(id));

    notifyListeners();
  }

  Future<DadosBensPatrimoniais> buscaBensPorId(int idBemPatrimonial) async {
    _isLoadingBens = false;
    _bemPatrimonial = helperDadoBemPatrimonial2(
        await db.dadosBemPatrimoniaisDao.getDadosInventariar(idBemPatrimonial));
    _isLoadingBens = true;
    notifyListeners();
    return _bemPatrimonial;
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
      Response response = await dio.post(
          "obterInventarioEstruturaOrganizacionalPorDemandaV2.json",
          data: filter);
      _nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];
      print((response.data["objects"] as List<dynamic>).first["inventario"]
          ["codigoENome"]);
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

  void atualizaDados(DadosBensPatrimoniais item) {
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
        .toList();
    _nomeEstrutura = null;
    _isLoadingEstruturas = false;
    notifyListeners();
  }
}
