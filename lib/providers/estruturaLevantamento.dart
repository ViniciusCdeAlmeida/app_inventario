import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventarioNew> _levantamentos = [];
  List<EstruturaInventarioNew> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  // final int idOrganizacao;
  bool _isLoading = false;

  List<EstruturaInventarioNew> get getLevantamentos {
    return _levantamentos;
  }

  List<EstruturaInventarioNew> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return [..._bensEstrutura];
  }

  void buscaPorEstrutura(int id) {
    List<EstruturaInventarioNew> lista =
        _levantamentos.where((element) => element.idInventario == id).toList();
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
    var listaDadosBens = lista.map((e) => e.dadosBensPatrimoniais);
    if (lista.isNotEmpty) {
      _bensEstrutura
          .addAll(listaDadosBens.expand((element) => element).toList());
    } else {
      _bensEstrutura.clear();
    }
  }

  bool get isLoading => _isLoading;

  Future<void> _getLevantamento(String conexao, int idLevantamento) async {
    // dynamic teste;
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

      _levantamentos
          .addAll(helperEstruturaInventarioEst(response.data["objects"]));
      // levantamentos = helperEstruturaInventarioEst(response.data["objects"]);
      // (_levantamentos).map((e) => teste = e);
      // print(teste);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaEstruturas(
    String conexao,
    List<Levantamento> listLevantamento,
  ) async {
    _levantamentos.clear();
    markAsLoading();

    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList();

    _isLoading = false;
    print('ACABOU');
    notifyListeners();
  }
}
