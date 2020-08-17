import 'dart:io';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DominioProvier with ChangeNotifier {
  List<Dominio> _dominios = [];

  bool _isLoading = false;

  List<Dominio> get getDominios {
    return [..._dominios];
  }

  List<Dominio> get getDominiosMarca {
    return [
      ..._dominios.where((element) => element.chave == 'tipoCaractMarca')
    ];
  }

  List<DropdownMenuItem<Dominio>> getDominiosDropdownBens(String chave) {
    List<Dominio> dominioFiltrado = [
      ..._dominios.where((element) => element.chave == chave)
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
    return [..._dominios.where((element) => element.chave == chave)];
  }

  bool get isLoading => _isLoading;

  Future<List<Dominio>> _getDominios(String conexao) async {
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
      return helperDominioLista(response.data["payload"]);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaDominios(String conexao) async {
    markAsLoading();
    _dominios = await _getDominios(conexao);

    _isLoading = false;
    notifyListeners();
  }
}
