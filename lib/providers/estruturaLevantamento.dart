import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
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

  // Levantamentos({this.levantamentos, this.idOrganizacao});

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
    // List<EstruturaInventarioNew> lista = _levantamentos
    // .where((element) => element.estruturaOrganizacional.id == id
    //     );

    // List<EstruturaInventarioNew> lista = new List();
    // _levantamentos.forEach((element, idx) {
    //   lista.add(element[idx]);
    // });
    // List<DadosBensPatrimoniais> lista2 = [];
    List<EstruturaInventarioNew> lista = _levantamentosEstrutura
        .where((element) => element.estruturaOrganizacional.id == id)
        .toList();
    var listaDadosBens = lista.map((e) => e.dadosBensPatrimoniais);

    // teste3.toList();
    // print(teste3);
    _bensEstrutura.addAll(listaDadosBens.expand((element) => element));
    dynamic teste = _levantamentos.whereType<EstruturaInventarioNew>();
    // List<DadosBensPatrimoniais> listDados = lista
    //     .map((e) =>
    //         e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>().toList())
    //     .cast<DadosBensPatrimoniais>()
    //     .toList();
    // print('object');
    if (lista.isNotEmpty) {
      // _bensEstrutura = lista.map(
      //     (e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>().toList()).cast<DadosBensPatrimoniais>().toList();
      // _bensEstrutura = lista.whereType<DadosBensPatrimoniais>().toList();
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
    // List<int> list = [1, 2, 3, 4, 5];
    // Iterable<Future<List<EstruturaInventarioNew>>> mapped;

    // Prints ints 1 second apart
    // mapped = listLevantamento.map((element) => _getLevantamento(conexao, element.id));
    // for (Future<List<EstruturaInventarioNew>> f in mapped) {
    //   print(await f);
    // }
    markAsLoading();
    // listLevantamento.map((element)  {
    // print(element.id);
    // levantamentos =  Future.wait(_getLevantamento(conexao, element.id));
    // print('object');
    // });
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList();
    // levantamentos = await _getLevantamento(conexao);
    _isLoading = false;
    print('ACABOU');
    notifyListeners();
  }
}
