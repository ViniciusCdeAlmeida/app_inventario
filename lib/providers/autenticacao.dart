import 'dart:async';
import 'dart:io';
import 'package:app_inventario/helpers/helper_organizacoes.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/conexao.dart';
import 'package:app_inventario/models/serialized/login.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../models/http_exception.dart';

class Autenticacao with ChangeNotifier {
  Login _usrLogado;
  Conexao _conexaoAtual;
  int idOrganizacao;
  List<Organizacoes> _organizacoes = [];
  bool _existeOrganizacao = false;
  // String _token;
  // String _userId;

  // String get token {}

  bool get existeUsuario {
    return _usrLogado != null;
  }

  String get usuarioLogado {
    return _usrLogado.username;
  }

  List<Organizacoes> get listaOrganizacoes {
    return [..._organizacoes];
  }

  int get idUnidade {
    return idOrganizacao;
  }

  bool get getExisteOrganizacao {
    if (!_existeOrganizacao) {
      return false;
    } else
      return true;
  }

  String get atualConexao {
    return _conexaoAtual.url;
  }

  set idUnidade(int idOrganizacao) {
    this.idOrganizacao = idOrganizacao;
  }

  Future<void> getVerificaOrganizacaoDB() async {
    if (helperOrganizacoes(
            await db.unidadesGestorasDao.getVerificaUnidades()) !=
        null) {
      _existeOrganizacao = true;
    }
  }

  Future<void> getOrganizacoesDB() async {
    _organizacoes =
        helperOrganizacoesLista(await db.unidadesGestorasDao.getAllUnidades());
    notifyListeners();
  }

  Future<List<Organizacoes>> listaUnidades() async {
    return helperOrganizacoesLista(
        await db.unidadesGestorasDao.getAllUnidades());
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
      if (!_existeOrganizacao) {
        await db.unidadesGestorasDao
            .insertUnidadeGestora(response.data['organizacoes'] as List)
            .whenComplete(() => _existeOrganizacao = true);
      }
      _usrLogado = Login.fromJson(response.data);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> login(String userName, String password) async {
    await getVerificaOrganizacaoDB();
    // db.deleteTable(db.unidadesGestorasDB);
    await _authenticate(userName, password);
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
