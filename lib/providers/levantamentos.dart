import 'dart:io';

import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> _levantamentos = [];
  final int idOrganizacao;

  Levantamentos(this._levantamentos, this.idOrganizacao);

  List<Levantamento> get levantamentos {
    return [..._levantamentos];
  }

  Future<void> _getLevantamento(int idOrganizacao, String conexao) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);

    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => trustSelfSigned;
    };
    try {
      Response response = await dio
          .get("obterLevantamentosPorUGV2/?idOrganizacao=$idOrganizacao");
      // print(response.data);
      _levantamentos = List<Levantamento>.from(
        (response.data).map(
          (item) => Levantamento(
            id: item['id'],
            codigo: item['codigo'],
            dataInicio: item['dataInicio'],
            idOrganizacao: item['idOrganizacao'],
            nome: item['nome'],
            quantidadeEstruturas: item['quantidadeEstruturas'],
            quantidadeTotalBens: item['quantidadeTotalBens'],
            dominioStatusInventario: Dominio(
              id: item['dominioStatusInventario']['id'],
              nome: item['dominioStatusInventario']['nome'],
              descricao: item['dominioStatusInventario']['descricao'],
              chave: item['dominioStatusInventario']['chave'],
              codigo: item['dominioStatusInventario']['codigo'],
            ),
            dominioTipoInventario: Dominio(
              id: item['dominioTipoInventario']['id'],
              nome: item['dominioTipoInventario']['nome'],
              descricao: item['dominioTipoInventario']['descricao'],
              chave: item['dominioTipoInventario']['chave'],
              codigo: item['dominioTipoInventario']['codigo'],
            ),
          ),
        ),
      );
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    return _getLevantamento(idOrganizacao, conexao);
  }
}
