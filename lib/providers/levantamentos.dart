import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/helpers/helpers_organizacao.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> levantamentos = [];
  final int idOrganizacao;

  Levantamentos({this.levantamentos, this.idOrganizacao});

  List<Levantamento> get getLevantamentos {
    return [...levantamentos];
  }

  Future<void> _getLevantamento(int idOrganizacao, String conexao) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      Response response = await dio
          .get("obterLevantamentosPorUGV2/?idOrganizacao=$idOrganizacao",
              onReceiveProgress: (actbyt, totalbyt) {
        print('$actbyt');
      });
      levantamentos = helperLevantamento(response.data);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    return _getLevantamento(idOrganizacao, conexao);
  }
}
