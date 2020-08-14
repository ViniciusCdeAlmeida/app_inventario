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
  List<EstruturaInventarioNew> _estruturas = [];
  List<EstruturaInventarioNew> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  final List<Dominio> listaDominios;

  EstruturaLevantamento({this.listaDominios});

  String _nomeEstrutura;
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

  String get getNomeEstrutura {
    return _nomeEstrutura;
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

  dynamic buscaBensPorid(String id) {
    // dynamic lista = _levantamentosEstrutura
    //     .where((element) => element.dadosBensPatrimoniais.contains(id));
    // List<DadosBensPatrimoniais> lista2 = [];
    // dynamic lista2 = _levantamentosEstrutura
    //     .map((e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>());
    // List<DadosBensPatrimoniais> lista3 = _levantamentosEstrutura
    //     .map((e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>())
    //     .expand((element) => element)
    //     .toList();
    // lista2.add(lista);
    // var teste = lista3.where((element) => element.bemPatrimonial.id == id);
    // var teste2 = lista4
    // .where((element) => element.bemPatrimonial.numeroPatrimonial == id);
    // print(lista);
    // print(lista3); 89597
    // print(teste2);
    // print('object');

    List<DadosBensPatrimoniais> lista4 = _estruturas
        .map((e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>())
        .expand((element) => element)
        .toList();
    return lista4
        .where((element) => element.bemPatrimonial.numeroPatrimonial == id)
        .first;
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

      _nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];
      print((response.data["objects"] as List<dynamic>).first["inventario"]
          ["codigoENome"]);
      notifyListeners();
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
    _nomeEstrutura = null;
    // await _getLevantamento(conexao, 4);
    _isLoading = false;
    print('ACABOU');
    notifyListeners();
  }
}
