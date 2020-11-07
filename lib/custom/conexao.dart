import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

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
