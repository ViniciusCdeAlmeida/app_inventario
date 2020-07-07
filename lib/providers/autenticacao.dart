import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import '../models/http_exception.dart';

class Autenticacao with ChangeNotifier {
  String _token;
  String _userId;

  String get token {}

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String userName, String password) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    Dio dio = new Dio()
      ..options.baseUrl =
          "https://192.168.15.2:8443/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => trustSelfSigned;
    };
    String url =
        'https://192.168.15.2:8443/citgrp-patrimonio-web/rest/inventarioMobile/usuarioValidoV2?username=$userName&password=$password';
    try {
      final response = await dio
          .get("usuarioValidoV2/?username=$userName&password=$password");
      print(response.data.toString());

      final response2 = await ioClient.get(
        url,
      );
      final responseData = json.decode(response2.body) as Map<String, dynamic>;
      print(responseData);
      print(response.data['id']);
    } catch (error) {
      throw error;
    }

    notifyListeners();
  }

  Future<void> login(String userName, String password) async {
    return _authenticate(userName, password);
  }
}
