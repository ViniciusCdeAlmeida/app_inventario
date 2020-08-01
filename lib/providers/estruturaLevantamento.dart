import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventarioNew> _estruturas = [];
  List<EstruturaInventarioNew> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  String nomeEstrutura;
  // final int idOrganizacao;
  bool _isLoading = false;

  List<EstruturaInventarioNew> get getLevantamentos {
    return _estruturas;
  }

  List<EstruturaInventarioNew> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return [..._bensEstrutura];
  }

  void buscaPorEstrutura(int id) {
    List<EstruturaInventarioNew> lista =
        _estruturas.where((element) => element.idInventario == id).toList();
    if (lista.isNotEmpty) {
      _levantamentosEstrutura = lista;
    } else {
      _levantamentosEstrutura.clear();
    }
  }

//021230 020594 020556 020582 020576 010503
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

  bool get isLoading => _isLoading;

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
              onReceiveProgress: (actbyt, totalbyt) {
        // print('$actbyt');
      }, data: filter);

      nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];
      _estruturas
          .addAll(helperEstruturaInventarioEst(response.data["objects"]));
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaEstruturas(
      String conexao, List<Levantamento> listLevantamento) async {
    _estruturas.clear();
    markAsLoading();

    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList();
    // await _getLevantamento(conexao, 10);
    _isLoading = false;
    print('ACABOU');
    notifyListeners();
  }
}
