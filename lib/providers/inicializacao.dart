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

  List<Dominio> get getDominiosMarca {
    return [
      ...(db.dominioDao.getAllDominio() as List<Dominio>)
          .where((element) => element.chave == 'tipoCaractMarca')
    ];
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
    _dominios = helperDominioLista(await db.dominioDao.getAllDominio());
  }

  Future<void> getBensPatrimoniaisDB() async {
    _bensDemanda = helperBemPatrimonialLista(
        await db.bemPatrimoniaisDao.getAllBensPatrimoniais());
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

  void getDominiosBens2(String chave) {
    db.dominioDao.getDominioBens(chave);
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
        filter['start'] = itemAtual;
        Response response = await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            .timeout(
              Duration(minutes: 2),
            )
            .catchError((error) {
          throw error;
        });

        await db.bemPatrimoniaisDao
            .insertBensPatrimoniais(response.data["objects"] as List);
      } else {
        final response = await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            .timeout(Duration(minutes: 2))
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
