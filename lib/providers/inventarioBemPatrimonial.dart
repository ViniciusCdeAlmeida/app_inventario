import 'dart:convert';
import 'dart:io';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/inventarioBemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InventarioBemPatrimonialProvider with ChangeNotifier {
  bool _isLoading = false;
  List _inventariados = [];

  bool get isLoading => _isLoading;

  Future<void> _saveDados(InventarioBemPatrimonial item, String conexao) async {
    _inventariados.add(toJson(item));

    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      await dio.post("saveInventarioBemPatrimonialMobile.json",
          onReceiveProgress: (actbyt, totalbyt) {
        // print('$actbyt');
      }, data: _inventariados);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> salvaDados(InventarioBemPatrimonial item, String conexao) async {
    markAsLoading();
    await _saveDados(item, conexao);

    _inventariados.clear();
    _isLoading = false;
    notifyListeners();
  }
}
