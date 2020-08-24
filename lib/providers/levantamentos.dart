import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> levantamentos = [];
  final int idOrganizacao;
  String _nomeLevantamento;
  bool _isLoading = false;
  Box<Levantamento> _levantamentosBox = Hive.box<Levantamento>('levantamento');

  Levantamentos({this.levantamentos, this.idOrganizacao});

  List<Levantamento> get getLevantamentos {
    return _levantamentosBox.values.toList();
  }

  String get getNomeLevantamentos {
    return _nomeLevantamento;
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
          .get("obterLevantamentosPorUGV3.json?idOrganizacao=$idOrganizacao");

      await _levantamentosBox
          .addAll(helperLevantamentoList(response.data["payload"]));
      return _levantamentosBox.values.toList();
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    // notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    markAsLoading();
    levantamentos = _levantamentosBox.isEmpty
        ? await _getLevantamento(idOrganizacao, conexao)
        : _levantamentosBox.values.toList();

    _isLoading = false;
    notifyListeners();
  }
}
