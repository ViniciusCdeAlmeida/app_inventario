import 'dart:io';

import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_inventario/main.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> _levantamentos = [];
  final int idOrganizacao;
  String _nomeLevantamento;
  bool _isLoading = false;
  bool _existeInventario = false;

  Levantamentos({this.idOrganizacao});

  String get getNomeLevantamentos {
    return _nomeLevantamento;
  }

  bool get isLoading => _isLoading;

  bool get getExisteInventarios {
    getVerificaInventariosDB();
    if (!_existeInventario) {
      return false;
    } else
      return true;
  }

  List<Levantamento> get getLevantamentos {
    return [..._levantamentos];
  }

  Future<void> getVerificaInventariosDB() async {
    if (helperLevantamento(
            await db.levantamentosDao.getVerificaLevantamentos()) !=
        null) {
      _existeInventario = true;
    }
  }

  Future<bool> getVerificaInventarios2DB() async {
    if (helperLevantamento(
            await db.levantamentosDao.getVerificaLevantamentos()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<void> getLevantamentosDB(int idOrganizacao) async {
    _levantamentos = helperLevantamentoList(
        await db.levantamentosDao.getAllLevantamentos(idOrganizacao));
    notifyListeners();
  }

  Future<List<Levantamento>> getLevantamentos2DB(int idOrganizacao) async {
    return helperLevantamentoList(
        await db.levantamentosDao.getAllLevantamentos(idOrganizacao));
  }

  Future<void> _getLevantamento(int idOrganizacao, String conexao) async {
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
          .get("obterLevantamentosPorUGV3.json?idOrganizacao=$idOrganizacao")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });

      await db.levantamentosDao
          .insertLevantamentos(response.data["payload"] as List);
      await getLevantamentosDB(idOrganizacao);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Levantamento>> _getLevantamento2(
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
          .get("obterLevantamentosPorUGV3.json?idOrganizacao=$idOrganizacao")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });

      await db.levantamentosDao
          .insertLevantamentos(response.data["payload"] as List);
      return await getLevantamentos2DB(idOrganizacao);
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    // db.deleteTable(db.levantamentoDB);
    await getVerificaInventariosDB();
    markAsLoading();
    if (!_existeInventario) {
      await _getLevantamento(idOrganizacao, conexao);
    } else {
      await getLevantamentosDB(idOrganizacao);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<List<Levantamento>> buscaLevantamento2(
      int idOrganizacao, String conexao) async {
    // db.deleteTable(db.levantamentoDB);

    return await _getLevantamento2(idOrganizacao, conexao);
  }
}
