import 'dart:io';
import 'package:app_inventario/helpers/helper_bemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/models/bens.dart';

class BensProvier with ChangeNotifier {
  List<Bens> _bens = [];
  List<Bens> _bensEstrutura = [];

  bool _isLoading = false;

  List<Bens> get getBens {
    return _bens;
  }

  List<Bens> get getBensEstrutura {
    return [..._bensEstrutura];
  }

  void buscaPorEstrutura(int id) {
    List<Bens> lista =
        _bens.where((element) => element.idEstutura == id).toList();
    if (lista.isNotEmpty) {
      _bensEstrutura = lista;
    } else {
      _bensEstrutura.clear();
    }
  }

  bool get isLoading => _isLoading;

  Future<List<Bens>> _getBens(String conexao) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      Response response = await dio.get("obterBensPatrimoniais.json",
          onReceiveProgress: (actbyt, totalbyt) {
        // print('$actbyt');
      });
      return helperBemPatrimonial(response.data["payload"]);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaBens(String conexao) async {
    markAsLoading();
    _bens = await _getBens(conexao);

    _isLoading = false;
    notifyListeners();
  }
}
