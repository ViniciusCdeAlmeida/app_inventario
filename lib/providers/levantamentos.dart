import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> levantamentos = [];
  final int idOrganizacao;
  bool _isLoading = false;

  Levantamentos({this.levantamentos, this.idOrganizacao});

  List<Levantamento> get getLevantamentos {
    return levantamentos;
  }

  bool get isLoading => _isLoading;

  Future<List<Levantamento>> _getLevantamento(
      int idOrganizacao, String conexao) async {
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
        // print('$actbyt');
      });
      print('Entrou Levantamentos Provider');
      return helperLevantamento(response.data);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    markAsLoading();
    levantamentos = await _getLevantamento(idOrganizacao, conexao);

    _isLoading = false;
    notifyListeners();
  }
}
