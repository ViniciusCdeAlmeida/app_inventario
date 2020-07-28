import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamentoFisicoEst.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventarioNew> levantamentos = [];
  // final int idOrganizacao;
  // bool _isLoading = false;

  // Levantamentos({this.levantamentos, this.idOrganizacao});

  List<EstruturaInventarioNew> get getLevantamentos {
    return levantamentos;
  }

  // bool get isLoading => _isLoading;

  Future<List<EstruturaInventarioNew>> _getLevantamento(String conexao) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      // Response response = await dio
      //     .get("obterLevantamentosPorUGV3.json?idOrganizacao=$idOrganizacao",
      //         onReceiveProgress: (actbyt, totalbyt) {
      //   // print('$actbyt');
      // });
      final filter = {
        "start": 1,
        "dir": "asc",
        "sort": "id",
        "limit": 100000,
        "filters": [
          {
            "type": "numeric",
            "field": "inventario.id",
            "value": 57,
          },
        ],
      };
      Response response = await dio
          .post("obterInventarioEstruturaOrganizacionalPorDemandaV2.json",
              onReceiveProgress: (actbyt, totalbyt) {
        // print('$actbyt');
      }, data: filter);
      return helperEstruturaInventarioEst(response.data["objects"]);
    } catch (error) {
      throw error;
    }
  }

  // void markAsLoading() {
  //   _isLoading = true;
  //   notifyListeners();
  // }

  Future<void> buscaLevantamento(String conexao) async {
    // markAsLoading();
    levantamentos = await _getLevantamento(conexao);

    // _isLoading = false;
    // notifyListeners();
  }
}
