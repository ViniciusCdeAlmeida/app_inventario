import 'dart:async';
import 'dart:io';
import 'package:app_inventario/helpers/helper_usuario.dart';
import 'package:app_inventario/models/conexao.dart';
import 'package:app_inventario/models/login.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../models/http_exception.dart';

class Autenticacao with ChangeNotifier {
  Login _usrLogado;
  Conexao _conexaoAtual;
  int idOrganizacao;
  // String _token;
  // String _userId;

  // String get token {}

  bool get existeUsuario {
    return _usrLogado != null;
  }

  List<Organizacao> listaOrganizacoes() {
    return _usrLogado.organizacao;
  }

  String get usuarioLogado {
    return _usrLogado.userName;
  }

  List<Organizacao> get lista2Organizacoes {
    return [..._usrLogado.organizacao];
  }

  get idUnidade {
    return idOrganizacao;
  }

  set idUnidade(int idOrganizacao) {
    this.idOrganizacao = idOrganizacao;
  }

  String get atualConexao {
    return _conexaoAtual.url;
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
          // .get("usuarioValidoV2/?username=$userName&password=$password");
          .get("usuarioValidoV2/?username=vinicius.correa&password=interno");
      _usrLogado = helperLogin(response.data);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> login(String userName, String password) async {
    return _authenticate(userName, password);
  }

  Future<void> sair() async {
    _usrLogado = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Conexao conexaoAtual(List<Conexao> conexao) {
    _conexaoAtual =
        conexao.where((element) => (element.ativo == true)).toList()[0];
    return _conexaoAtual;
  }
}
