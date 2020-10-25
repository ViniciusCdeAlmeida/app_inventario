import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/main.dart';

class InventarioBensPatrimoniais with ChangeNotifier {
  bool _isLoading = false;
  List<InventarioBemPatrimonial> _inventariados = [];

  bool get isLoading => _isLoading;

  List<InventarioBemPatrimonial> get getInventariados {
    return [..._inventariados];
  }

  Future<void> buscaBensInventariados(int idUnidade) async {
    _isLoading = false;
    _inventariados = helperInventarioBemPatrimonialLista(
        await db.inventarioBemPatrimonialDao.getInventariados(idUnidade));
    _isLoading = true;
    notifyListeners();
  }

  Future<void> _enviaDados(String conexao) async {
    List itens = [..._inventariados]
        .where((element) => element.enviado == false)
        .map((e) => e.toJson())
        .toList();

    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      await dio
          .post("saveInventarioBemPatrimonialMobile.json", data: itens)
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error.error.message == "Connection failed"
            ? "Falha de conexão."
            : error.error.message;
      });
      itens
          .map((e) async => await db.inventarioBemPatrimonialDao
              .updateDadosInventariado(e['numeroPatrimonial']))
          .toList();
    } catch (error) {
      throw error;
    }
  }

  Future _gravaDados(InventarioBemPatrimonial bemPatrimonial) async {
    await db.inventarioBemPatrimonialDao
        .insertInventarioBensPatrimoniais(bemPatrimonial);

    await db.dadosBemPatrimoniaisDao
        .updateDadosBemPatrimonial(bemPatrimonial.idDadosBemPatrimonialMobile);
    await db.bemPatrimoniaisDao
        .updateBemPatrimonial(bemPatrimonial.idDadosBemPatrimonialMobile);
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> enviaDados(String conexao) async {
    markAsLoading();
    await _enviaDados(conexao).then((value) => null);

    // _inventariados.clear();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> gravaDados(InventarioBemPatrimonial item) async {
    await _gravaDados(item);
  }
}
