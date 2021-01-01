import 'dart:async';

import 'package:GRPInventario/providers/stores/index_store.dart';
import 'package:dio/dio.dart';

import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/main.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/utils/index_utils.dart';

/// Responsável por gerenciar as requisições dos stores [InicializacaoStore] e [LoginStore].
class AutenticacaoProvider {
  int idOrganizacao;
  bool _existeOrganizacao = false;

  int get idUnidade {
    return idOrganizacao;
  }

  set idUnidade(int idOrganizacao) {
    this.idOrganizacao = idOrganizacao;
  }

  /// Verifica se já existe uma [Organizacao] presente na base de dados.
  Future<void> _getVerificaOrganizacaoDB() async {
    if (helperOrganizacoes(
            await db.unidadesGestorasDao.getVerificaUnidades()) !=
        null) {
      _existeOrganizacao = true;
    }
  }

  /// Busca todas as organizações na base de dados.
  Future<List<Organizacoes>> getOrganizacoesDB() async =>
      helperOrganizacoesListaDB(await db.unidadesGestorasDao.getAllUnidades());

  /// Autentica o usuário com [usuario] e [senha] no servidor
  /// verificando se já existe [Organizacoes] na base.
  Future<Login> _authenticate(String usuario, String senha) async {
    try {
      Response response =
          await Endpoint.getAutenticacao(usuario: usuario, senha: senha);
      // .timeout(
      //   Duration(seconds: 50),
      // )
      if (!_existeOrganizacao) {
        await db.unidadesGestorasDao
            .insertUnidadeGestora(response.data['organizacoes'] as List)
            .whenComplete(() => _existeOrganizacao = true);
      }
      var _usuarioOffline = await db.usuarioDao.getUsuario();
      if (_usuarioOffline == null) {
        /// Verifica se já existe um usuário offline salva na base
        /// se não houver é inserido o registro na base.
        await db.usuarioDao.insertUsuario();
      }

      if (_usuarioOffline.organizacoes == null) {
        /// Verifica se já existe organizações para o usuário offline salvas na base
        /// se não houver o é atualizado o registro do usuario offline.
        db.usuarioDao.updateUsuario(
          helperOrganizacoesLista(response.data['organizacoes']),
        );
      }
      return Login.fromJson(response.data);
    } on NoSuchMethodError {
      throw "Usuário e/ou senha incorretos.";
    } catch (error) {
      throw error;
    }
  }

  /// Autentica o usuário offline presente na base.
  Future<Login> _authenticateOffline() async {
    try {
      return helperLogin(await db.usuarioDao.getUsuario());
    } catch (error) {
      throw error;
    }
  }

  ///Realiza a autenticação de um usuário seja ele online ou não e retornando um [Login].
  Future<Login> login({String userName, String password, bool offline}) async {
    try {
      await buscaConexaoAtiva();
      await _getVerificaOrganizacaoDB();
      if (!offline) {
        // db.deleteTable(db.unidadesGestorasDB);
        return await _authenticate(userName, password);
      } else
        return await _authenticateOffline();
    } catch (e) {
      throw e;
    }
  }
}
