import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Levantamento with ChangeNotifier {
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
          // .get("usuarioValidoV2/?username=$userName&password=$password");
          // .get("usuarioValidoV2/?username=vinicius.correa&password=interno");
          .get("obterLevantamentosPorUG/?idOrganizacao=$idOrganizacao");
      print(response);
      // _usrLogado = Login(
      //   id: response.data['id'].toString(),
      //   organizacao: (response.data['organizacoes'] as List<dynamic>)
      //       .map(
      //         (item) => Organizacao(
      //           codigo: item['organizacao']['codigo'],
      //           codigoENome: item['organizacao']['codigoENome'],
      //           id: item['id'],
      //           sigla: item['organizacao']['sigla'],
      //           nome: item['organizacao']['nome'],
      //         ),
      //       )
      //       .toList(),
      //   userName: response.data['username'],
      // );
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> buscaLevantamento(int idOrganizacao, String conexao) async {
    return _getLevantamento(idOrganizacao, conexao);
  }
}
