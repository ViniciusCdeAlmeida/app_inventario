import 'dart:io';
import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BensProvier with ChangeNotifier {
  List<BemPatrimonial> _bens = [];
  // List<BemPatrimonialDemanda> _bensDemanda = [];
  List<BemPatrimonial> _bensEstrutura = [];
  // int _startFilter = 0;

  // Map filter = {
  //   "start": 1,
  //   "dir": "asc",
  //   "sort": "numeroPatrimonial",
  //   "limit": 10,
  //   "filters": [],
  // };

  bool _isLoading = false;

  List<BemPatrimonial> get getBens {
    return _bens;
  }

  List<BemPatrimonial> get getBensEstrutura {
    return [..._bensEstrutura];
  }

  void buscaPorEstrutura(int id) {
    List<BemPatrimonial> lista =
        _bens.where((element) => element.id == id).toList();
    if (lista.isNotEmpty) {
      _bensEstrutura = lista;
    } else {
      _bensEstrutura.clear();
    }
  }

  bool get isLoading => _isLoading;

  // Future<List<BemPatrimonial>> _getBens(String conexao) async {
  //   Dio dio = new Dio()
  //     ..options.baseUrl =
  //         conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //   };
  //   try {
  //     Response response = await dio.get("obterBensPatrimoniais.json");
  //     return helperBemPatrimonial(response.data["payload"]);
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  // Future<void> _getBensDemanda(String conexao) async {
  //   Dio dio = new Dio()
  //     ..options.baseUrl =
  //         conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //   };
  //   try {
  //     if (_startFilter != 0 && filter['start'] < _startFilter) {
  //       Response response =
  //           await dio.post("obterBensPatrimoniaisDemandaV2.json", data: filter);
  //       _bensDemanda
  //           .addAll(helperBemPatrimonialDemanda(response.data["objects"]));
  //     } else {
  //       Response response = await dio
  //           .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
  //           .then(
  //         (value) {
  //           _startFilter = value.data['totalPages'];
  //         },
  //       );
  //     }
  //     // Response response =
  //     //     await dio.get("obterBensPatrimoniaisDemandaV2.json").then((value) {});
  //     // return helperBemPatrimonial(response.data["payload"]);
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaBens(String conexao) async {
    markAsLoading();
    // _bens = await _getBens(conexao);
    // await _getBensDemanda(conexao);
    // if (_startFilter != 0) {
    //   await _getBensDemanda(conexao);
    //   _isLoading = false;
    //   notifyListeners();
    // } else {
    //   _isLoading = false;
    //   notifyListeners();
    // }
    _isLoading = false;
    notifyListeners();
  }
}
