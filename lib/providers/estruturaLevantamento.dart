import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventarioNew> _estruturas = [];
  List<EstruturaInventarioNew> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  String _quantidadeDigitos;
  String _digitoVerificador;
  final List<Dominio> listaDominios;
  Box<EstruturaInventarioNew> _estruturasBox =
      Hive.box<EstruturaInventarioNew>('estruturaInventarioNew');
  bool existe = false;
  EstruturaLevantamento({this.listaDominios});

  String _nomeEstrutura;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<EstruturaInventarioNew> get getLevantamentos {
    return _estruturasBox.values.toList();
  }

  List<EstruturaInventarioNew> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return [..._bensEstrutura];
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

  void buscaPorEstrutura(int id) {
    List<EstruturaInventarioNew> lista = _estruturasBox.values
        .toList()
        .where((element) => element.idInventario == id)
        .toList();
    if (lista.isNotEmpty) {
      _levantamentosEstrutura = lista;
    } else {
      _levantamentosEstrutura.clear();
    }
  }

  void buscaBensPorEstrutura(int id) {
    _bensEstrutura.clear();
    List<EstruturaInventarioNew> lista = _levantamentosEstrutura
        .where((element) => element.estruturaOrganizacional.id == id)
        .toList();

    if (lista.isNotEmpty) {
      _bensEstrutura.addAll(lista
          .map((e) => e.dadosBensPatrimoniais)
          .expand((element) => element)
          .toList());
    } else {
      _bensEstrutura.clear();
    }
  }

  dynamic buscaBensPorid(String id) {
    List<DadosBensPatrimoniais> listaBens = _estruturasBox.values
        .toList()
        .map((e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>())
        .expand((element) => element)
        .toList();
    return listaBens
        .where((element) => element.bemPatrimonial.numeroPatrimonial == id)
        .first;
  }

  Future<void> _getLevantamento(String conexao, int idLevantamento) async {
    if (_estruturasBox.isEmpty || !existe) {
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
        // _estruturas.addAll(helperEstruturaInventarioEst(
        //     response.data["objects"], listaDominios));
        await _estruturasBox.addAll(helperEstruturaInventarioEst(
            response.data["objects"], listaDominios));
      } catch (error) {
        throw error;
      }
    }
  }

  void markAsLoading() {
    _isLoading = true;
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
    if (_estruturasBox.isNotEmpty) existe = true;
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList()
        .whenComplete(() => existe = true);
    _nomeEstrutura = null;
    _isLoading = false;
    print('ACABOU');
    notifyListeners();
  }
}
