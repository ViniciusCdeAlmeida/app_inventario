import 'dart:io';

import 'package:app_inventario/helpers/helpers_organizacao.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Unidades with ChangeNotifier {
  List<Organizacao> unidades = [];
  final int idInventario;

  Unidades({this.idInventario});

  List<Organizacao> get getUnidades {
    return [...unidades];
  }

  Future<void> _getEstruturasLevantamento(
      int idInventario, String conexao) async {
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
          .get("estruturaPorInventarioV2/?idInventario=$idInventario",
              onReceiveProgress: (actbyt, totalbyt) {
        print('$actbyt');
      });
      unidades = helperUnidades(response.data);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> buscaEstruturasLevantamento(
      int idInventario, String conexao) async {
    return _getEstruturasLevantamento(idInventario, conexao);
  }
}
