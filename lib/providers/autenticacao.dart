import 'dart:async';
import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_login.dart';
import 'package:app_inventario/helpers/helper_organizacoes.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/login.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:dio/dio.dart';

// import '../models/http_exception.dart';

class Autenticacao {
  int idOrganizacao;
  bool _existeOrganizacao = false;
  // String _token;
  // String _userId;

  // String get token {}

  int get idUnidade {
    return idOrganizacao;
  }

  bool get getExisteOrganizacao {
    if (!_existeOrganizacao) {
      return false;
    } else
      return true;
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
      return helperLogin(await db.usuarioDao.getUsuario());
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
}
