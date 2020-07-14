import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:app_inventario/models/conexao.dart';
import 'package:app_inventario/models/login.dart';
import 'package:app_inventario/models/organizacao.dart';
// import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

// import '../models/http_exception.dart';

class Autenticacao with ChangeNotifier {
  Login usrLogado;
  Conexao _conexaoAtual;
  // String _token;
  String _userId;

  // String get token {}

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String userName, String password) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);

    Dio dio = new Dio()
      ..options.baseUrl =
          _conexaoAtual.url + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => trustSelfSigned;
    };
    try {
      Response response = await dio
          .get("usuarioValidoV2/?username=$userName&password=$password");
      usrLogado = Login(
        id: response.data['id'].toString(),
        organizacao: (response.data['organizacoes'] as List<dynamic>)
            .map(
              (item) => Organizacao(
                codigo: item['organizacao']['codigo'],
                codigoENome: item['organizacao']['codigoENome'],
                id: item['id'],
                sigla: item['organizacao']['sigla'],
                nome: item['organizacao']['nome'],
              ),
            )
            .toList(),
        userName: response.data['username'],
      );
    } catch (error) {
      throw error;
    }
    print(usrLogado);

    notifyListeners();
  }

  Future<void> login(String userName, String password) async {
    return _authenticate(userName, password);
  }

  Conexao conexaoAtual(List<Conexao> conexao) {
    _conexaoAtual =
        conexao.where((element) => (element.ativo == true)).toList()[0];
    return _conexaoAtual;
  }
}
