import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_bemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/main.dart';
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
    "filters": []
  };

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
        print('Buscando pagina $itemAtual:' + DateTime.now().toString());
        filter['start'] = itemAtual;
        await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            .then((value) async {
          await db.bemPatrimoniaisDao
              .insertBensPatrimoniais(value.data["objects"] as List);
        });

        // .post("obterBensPatrimoniaisDemanda.json", data: filter);
        print('Buscado pagina $itemAtual:' + DateTime.now().toString());
        print('Salvando pagina $itemAtual:' + DateTime.now().toString());
        // print(response);

        print('Salvo pagina $itemAtual:' + DateTime.now().toString());
      } else {
        await getConexaoPrefs(conexao)
            .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
            // .post("obterBensPatrimoniaisDemanda.json", data: filter)
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
