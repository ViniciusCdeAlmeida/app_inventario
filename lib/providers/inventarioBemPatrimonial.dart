import 'dart:io';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_inventario/main.dart';

class InventarioBensPatrimoniais with ChangeNotifier {
  bool _isLoading = false;
  List _inventariados = [];

  bool get isLoading => _isLoading;

  Future<void> _enviaDados(
      InventarioBemPatrimonial item, String conexao) async {
    // _inventariados.add(toJson(item));

    // Dio dio = new Dio()
    //   ..options.baseUrl =
    //       conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
    // try {
    //   await dio.post("saveInventarioBemPatrimonialMobile.json",
    //       data: _inventariados);
    // } catch (error) {
    //   throw error;
    // }
  }
  Future _gravaDados(InventarioBemPatrimonial bemPatrimonial) async {
    db.deleteTable(db.inventarioBemPatrimonialDB);
    await db.inventarioBemPatrimonialDao
        .insertInventarioBensPatrimoniais(bemPatrimonial);
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> enviaDados(InventarioBemPatrimonial item, String conexao) async {
    markAsLoading();
    await _enviaDados(item, conexao).then((value) => null);

    _inventariados.clear();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> gravaDados(InventarioBemPatrimonial item) async {
    markAsLoading();
    await _gravaDados(item);

    // _inventariados.clear();
    _isLoading = false;
    notifyListeners();
  }
}
