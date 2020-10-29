import 'dart:io';
import 'package:app_inventario/helpers/helper_bemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/main.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dominio.dart';

class Inicializacao with ChangeNotifier {
  List<Dominio> _dominios = [];
  int _startFilter = 0;
  // ignore: unused_field
  List<BemPatrimonial> _bensDemanda = [];

  Map filter = {
    "start": 1,
    "dir": "asc",
    "sort": "numeroPatrimonial",
    "limit": 1000,
    "filters": [],
  };

  Dio getConexaoPrefs(String conexao) {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    return dio;
  }

  List<Dominio> get getDominios {
    return [..._dominios];
  }

  Future<bool> getVerificaDominioDB() async {
    if (helperDominio(await db.dominioDao.getVerificaDominios()) != null) {
      return true;
    } else
      return false;
  }

  Future<bool> getVerificaBensPatrimoniaisDB() async {
    if (helperBemPatrimonial(
            await db.bemPatrimoniaisDao.getVerificaBensPatrimoniais()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<void> getDominiosDB() async {
    return helperDominioLista(await db.dominioDao.getAllDominio());
  }

  Future<void> _getDominios(String conexao) async {
    try {
      Response response = await getConexaoPrefs(conexao)
          .get("obterDominiosInventario.json")
          .timeout(
            Duration(minutes: 2),
          )
          .catchError((error) {
        throw error;
      });

      await db.dominioDao.insertDominio(response.data["payload"] as List);
    } catch (error) {
      throw error;
    }
  }

  Future<void> _getBensDemanda({String conexao, int itemAtual}) async {
    try {
      if (_startFilter != 0 && filter['start'] < _startFilter) {
        print('Buscando pagina $itemAtual\n');
        filter['start'] = itemAtual;
        Response response = await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            // .post("obterBensPatrimoniaisDemanda.json", data: filter)
            .catchError((error) {
          throw error;
        });
        print('Buscado pagina $itemAtual\n');
        print('Salvando pagina $itemAtual\n');
        await db.bemPatrimoniaisDao
            .insertBensPatrimoniais(response.data["objects"] as List);

        print('Salvo pagina $itemAtual\n');
      } else {
        await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            // .post("obterBensPatrimoniaisDemanda.json", data: filter)
            .catchError(
          (error) {
            throw error;
          },
        ).then(
          (value) {
            _startFilter = value.data['totalPages'];
          },
        );
      }
    } catch (error) {
      throw error;
    }
  }

  Future buscaDominioInicial(String conexao) async {
    // db.deleteTable(db.dominioDB);

    await _getDominios(conexao);
  }

  Future buscaBemPatrimonialInicial(String conexao) async {
    // db.deleteTable(db.bensPatrimoniaisDB);
    await _getBensDemanda(conexao: conexao);
    if (_startFilter != 0) {
      List<dynamic> maximo = [];
      for (var i = 0; i < _startFilter; i++) {
        maximo.insert(i, i + 1);
      }
      await Stream.fromIterable(maximo)
          .asyncMap(
            (element) => _getBensDemanda(conexao: conexao, itemAtual: element),
          )
          .toList();
    } else {
      return;
    }
  }
}
