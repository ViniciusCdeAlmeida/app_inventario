import 'dart:async';
import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_organizacoes.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/conexao.dart';
import 'package:app_inventario/models/serialized/login.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
    return helperOrganizacoesLista(
        await db.unidadesGestorasDao.getAllUnidades());
  }

  Future<List<Organizacoes>> listaUnidades() async {
    return helperOrganizacoesLista(
        await db.unidadesGestorasDao.getAllUnidades());
  }

  Future<void> _authenticate(String userName, String password) async {
    try {
      Response response = await getConexaoPrefs(_conexaoAtual.url)
          //.get("usuarioValidoV2/?username=$userName&password=$password");
          .get("usuarioValidoV2/?username=vinicius.correa&password=interno")
          // .get("usuarioValido.json?username=citsmart&password=interno")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });
      if (!_existeOrganizacao) {
        await db.unidadesGestorasDao
            .insertUnidadeGestora(response.data['organizacoes'] as List)
            .then((_) => _existeOrganizacao = true)
            .catchError(
          (error) {
            throw error;
          },
        );
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
