import 'dart:async';
import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_login.dart';
import 'package:app_inventario/helpers/helper_organizacoes.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/conexao.dart';
import 'package:app_inventario/models/serialized/login.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../models/http_exception.dart';

class Autenticacao {
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

  Future<void> getOrganizacoesDB() async =>
      helperOrganizacoesListaDB(await db.unidadesGestorasDao.getAllUnidades());

  Future<List<Organizacoes>> listaUnidades() async =>
      helperOrganizacoesListaDB(await db.unidadesGestorasDao.getAllUnidades());

  Future<Login> _authenticate(String userName, String password) async {
    try {
      Response response = await Endpoint.getAutenticacao();
      // .get("usuarioValido.json?username=citsmart&password=interno")
      // .timeout(
      //   Duration(seconds: 50),
      // )
      if (!_existeOrganizacao) {
        await db.unidadesGestorasDao
            .insertUnidadeGestora(response.data['organizacoes'] as List)
            .whenComplete(() => _existeOrganizacao = true);
      }
      var _usuarioOffline = await db.usuarioDao.getUsuario();
      if (_usuarioOffline.organizacoes == null)
        db.usuarioDao.updateUsuario(
          helperOrganizacoesLista(response.data['organizacoes']),
        );
      return Login.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<Login> _authenticateOffline() async {
    try {
      var _usuarioOffline = await db.usuarioDao.getUsuario();
      return helperLogin(_usuarioOffline);
    } catch (error) {
      throw error;
    }
  }

  Future<Login> login({String userName, String password, bool offline}) async {
    try {
      if (!offline) {
        await buscaConexaoAtiva();
        await getVerificaOrganizacaoDB();
        // db.deleteTable(db.unidadesGestorasDB);
        return await _authenticate(userName, password);
      } else
        return await _authenticateOffline();
    } catch (e) {
      throw e;
    }
  }

  Future<void> sair() async {
    _usrLogado = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Conexao conexaoAtual(List<Conexao> conexao) {
    _conexaoAtual =
        conexao.where((element) => (element.ativo == true)).toList()[0];
    return _conexaoAtual;
  }
}
