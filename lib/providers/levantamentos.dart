import 'dart:convert';
import 'dart:io';

import 'package:app_inventario/customizacoes/estagios.dart';
import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

class Levantamentos with ChangeNotifier {
  List<Levantamento> _levantamentos = [];
  final int idOrganizacao;
  Estagios estagio = Estagios.INICIAL;

  Levantamentos(this._levantamentos, this.idOrganizacao);

  List<Levantamento> get levantamentos {
    return [..._levantamentos];
  }

  Future<void> _getLevantamento(int idOrganizacao, String conexao) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => trustSelfSigned;
    };
    try {
      final response2 = await ioClient.get(conexao +
          "/citgrp-patrimonio-web/rest/inventarioMobile/obterLevantamentosPorUGV2/?idOrganizacao=$idOrganizacao");
      final responseData = json.decode(utf8.decode(response2.bodyBytes));
      print(response2.contentLength);
      Response response = await dio
          .get("obterLevantamentosPorUGV2/?idOrganizacao=$idOrganizacao",
              onReceiveProgress: (actbyt, totalbyt) {
        print('$actbyt');
        print('$totalbyt');
      });
      _levantamentos = compute(helperLevantamento(responseData));
      _levantamentos = helperLevantamento(response.data);
      // print(_levantamentos);
      estagio = Estagios.FINALIZADO;
    } catch (error) {
      estagio = Estagios.ERROR;
      throw error;
    }
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    this.estagio = Estagios.CARREGANDO;
    return _getLevantamento(idOrganizacao, conexao);
  }
}
