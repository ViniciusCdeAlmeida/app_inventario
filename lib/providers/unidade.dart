import 'dart:io';

import 'package:app_inventario/helpers/helpers_unidade.dart';
import 'package:app_inventario/models/estruturaInventario.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Unidades with ChangeNotifier {
  List<EstruturaInventario> unidades = [];
  final int idInventario;
  bool _isLoading = false;
  Box<EstruturaInventario> _unidadesBox =
      Hive.box<EstruturaInventario>('estruturaInventario');

  Unidades({this.idInventario});

  List<EstruturaInventario> get getUnidades {
    return [..._unidadesBox.values.toList()];
  }

  bool get isLoading => _isLoading;

  Future<List<EstruturaInventario>> _getEstruturasLevantamento(
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
      Response response =
          await dio.get("quantitativoBensStatusV2/?idInventario=$idInventario");
      // return helperEstruturaInventario(response.data);
      await _unidadesBox.addAll(helperEstruturaInventario(response.data));
      return _unidadesBox.values.toList();
    } catch (error) {
      throw error;
    }
  }

  Future<void> buscaEstruturasLevantamento(
      int idInventario, String conexao) async {
    _isLoading = true;
    notifyListeners();
    unidades = await _getEstruturasLevantamento(idInventario, conexao);

    _isLoading = false;
    notifyListeners();
  }
}
