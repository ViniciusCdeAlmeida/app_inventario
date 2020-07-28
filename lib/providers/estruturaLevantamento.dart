import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventarioNew> levantamentos = [];
  // final int idOrganizacao;
  bool _isLoading = false;

  // Levantamentos({this.levantamentos, this.idOrganizacao});

  List<EstruturaInventarioNew> get getLevantamentos {
    return levantamentos;
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
      levantamentos
          .addAll(helperEstruturaInventarioEst(response.data["objects"]));
      // levantamentos = helperEstruturaInventarioEst(response.data["objects"]);
      // (response.data["objects"] as List<dynamic>).map(
      //   (e) {
      //     (e['inventario'] as List<dynamic>).map((e2) {
      //       teste = e2['codigoENome'];
      //     });
      //   },
      // );
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
    levantamentos.clear();
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
    notifyListeners();
  }
}
