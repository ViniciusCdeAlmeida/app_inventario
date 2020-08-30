import 'dart:io';

import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/serialized/estruturaInventario.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EstruturaLevantamento with ChangeNotifier {
  List<EstruturaInventario> _estruturas = [];
  List<EstruturaInventario> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  String _quantidadeDigitos;
  String _digitoVerificador;
  // final List<Dominio> listaDominios;

  // EstruturaLevantamento({this.listaDominios});

  String _nomeEstrutura;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<EstruturaInventario> get getLevantamentos {
    return _estruturas;
  }

  List<EstruturaInventario> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  List<DadosBensPatrimoniais> get getBensPorEstrutura {
    return [..._bensEstrutura];
  }

  String get getNomeEstrutura {
    return _nomeEstrutura;
  }

  String get getDigitosLeitura {
    return _quantidadeDigitos;
  }

  String get getDigitoVerificador {
    return _digitoVerificador;
  }

  void setDigitosLeitura(String digitos) {
    _quantidadeDigitos = digitos;
  }

  void setDigitoVerificador(String digito) {
    _digitoVerificador = digito;
  }

  // void buscaPorEstrutura(int id) {
  //   List<EstruturaInventario> lista =
  //       _estruturas.where((element) => element.id == id).toList();
  //   if (lista.isNotEmpty) {
  //     _levantamentosEstrutura = lista;
  //   } else {
  //     _levantamentosEstrutura.clear();
  //   }
  // }

  // void buscaBensPorEstrutura(int id) {
  //   _bensEstrutura.clear();
  //   List<EstruturaInventario> lista = _levantamentosEstrutura
  //       .where((element) => element.estruturaOrganizacional.id == id)
  //       .toList();

  //   if (lista.isNotEmpty) {
  //     _bensEstrutura.addAll(lista
  //         .map((e) => e.dadosBensPatrimoniais)
  //         .expand((element) => element)
  //         .toList());
  //   } else {
  //     _bensEstrutura.clear();
  //   }
  // }

  // dynamic buscaBensPorid(String id) {
  //   List<DadosBensPatrimoniais> listaBens = _estruturas
  //       .map((e) => e.dadosBensPatrimoniais.whereType<DadosBensPatrimoniais>())
  //       .expand((element) => element)
  //       .toList();
  //   return listaBens
  //       .where((element) => element.bemPatrimonial.numeroPatrimonial == id)
  //       .first;
  // }

  Future<void> _getLevantamento(String conexao, int idLevantamento) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    try {
      final filter = {
        "start": 1,
        "dir": "asc",
        "sort": "id",
        "limit": 1000000,
        "filters": [
          {
            "type": "numeric",
            "field": "inventario.id",
            "value": idLevantamento,
          },
        ],
      };
      Response response = await dio.post(
          "obterInventarioEstruturaOrganizacionalPorDemandaV2.json",
          data: filter);
      _nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];
      print((response.data["objects"] as List<dynamic>).first["inventario"]
          ["codigoENome"]);
      notifyListeners();
      await db.estruturaInventarioDao
          .insertEstruturaInventario((response.data["objects"] as List));
      // _estruturas.addAll(
      //     EstruturaInventario.fromJson(response.data["objects"]));
    } catch (error) {
      throw error;
    }
  }

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void atualizaDados(DadosBensPatrimoniais item) {
    final idx = _bensEstrutura.indexWhere((value) => value.id == item.id);
    if (idx >= 0) {
      _bensEstrutura[idx].inventariado = true;
      notifyListeners();
    }
  }

  Future<void> buscaEst(int idInventario) async {
    // var teste1 =
    //     await db.estruturaInventarioDao.getAllEstruturasPorLevantamento(65);
    // var teste2 = await db.estruturaInventarioDao.getAllDadosPorEstrutura(2966);
    // print('object');
  }

  Future<void> buscaEstruturas(
      String conexao, List<Levantamento> listLevantamento) async {
    _estruturas.clear();
    markAsLoading();

    db.deleteTable(db.estruturaInventarioDB);
    db.deleteTable(db.dadosBemPatrimoniaisDB);
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(conexao, element.id))
        .toList();
    _nomeEstrutura = null;
    _isLoading = false;
    notifyListeners();
  }
}
