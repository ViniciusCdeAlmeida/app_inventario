import 'dart:io';
import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/bemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DominioProvier with ChangeNotifier {
  List<Dominio> _dominios = [];
  int _startFilter = 0;
  List<BemPatrimonialDemanda> _bensDemanda = [];
  Box<Dominio> _dominiosBox = Hive.box<Dominio>('dominios');
  Box<BemPatrimonialDemanda> _bemPatrimonialDemandaBox =
      Hive.box<BemPatrimonialDemanda>('bemPatrimonialDemanda');
// USED - 207, RSS - 551
  Map filter = {
    "start": 1,
    "dir": "asc",
    "sort": "numeroPatrimonial",
    "limit": 1000,
    "filters": [],
  };

  bool _isLoading = false;

  List<Dominio> get getDominios {
    return [..._dominiosBox.values.toList()];
  }

  List<DropdownMenuItem<Dominio>> getDominiosDropdownBens(String chave) {
    List<Dominio> dominioFiltrado = [
      ..._dominiosBox.values.toList().where((element) => element.chave == chave)
    ];
    return dominioFiltrado.map(
      (itens) {
        return DropdownMenuItem(
          value: itens,
          child: Text(itens.descricao),
        );
      },
    ).toList();
  }

  List<Dominio> getDominiosBens(String chave) {
    return [
      ..._dominiosBox.values.toList().where((element) => element.chave == chave)
    ];
  }

  bool get isLoading => _isLoading;

  Future<List<Dominio>> _getDominios(String conexao) async {
    if (_dominiosBox.isEmpty) {
      Dio dio = new Dio()
        ..options.baseUrl =
            conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
      try {
        Response response = await dio.get("obterDominiosInventario.json");
        _dominiosBox.addAll((helperDominioLista(response.data["payload"])));
        return _dominiosBox.values.toList();
      } catch (error) {
        throw error;
      }
    }
  }

  Future<void> _getBensDemanda({String conexao, int itemAtual}) async {
    if (_bemPatrimonialDemandaBox.isEmpty || filter['start'] < _startFilter) {
      Dio dio = new Dio()
        ..options.baseUrl =
            conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
      try {
        if (_startFilter != 0 && filter['start'] < _startFilter) {
          filter['start'] = itemAtual;
          Response response = await dio
              .post("obterBensPatrimoniaisDemandaV2.json", data: filter);
          await _bemPatrimonialDemandaBox.addAll(
              helperBemPatrimonialDemanda(response.data["objects"], _dominios));
        } else {
          final response = await dio
              .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
              .then(
            (value) {
              _startFilter = value.data['totalPages'];
            },
          );
        }
      } catch (error) {
        throw error;
      }
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaDominios(String conexao) async {
    // Hive.close();
    markAsLoading();
    _dominios = await _getDominios(conexao);
    await _getBensDemanda(conexao: conexao);
    if (_startFilter != 0) {
      List<dynamic> teste = [];
      for (var i = 0; i < _startFilter; i++) {
        teste.insert(i, i + 1);
      }
      await Stream.fromIterable(teste)
          .asyncMap(
            (element) => _getBensDemanda(conexao: conexao, itemAtual: element),
          )
          .toList();
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
    }
    // _isLoading = false;
    // notifyListeners();
  }
}
