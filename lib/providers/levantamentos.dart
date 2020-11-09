import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_inventario/main.dart';

class Levantamentos with ChangeNotifier {
  final int idOrganizacao;
  String _nomeLevantamento;

  Levantamentos({this.idOrganizacao});

  String get getNomeLevantamentos {
    return _nomeLevantamento;
  }

  Future<bool> getVerificaInventariosDB() async {
    if (helperLevantamento(
            await db.levantamentosDao.getVerificaLevantamentos()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<List<Levantamento>> getLevantamentosDB(int idOrganizacao) async {
    return helperLevantamentoList(
        await db.levantamentosDao.getAllLevantamentos(idOrganizacao));
  }

  Future<Levantamento> getLevantamentoDB(int id) async {
    return helperLevantamento(await db.levantamentosDao.getLevantamento(id));
  }

  Future<Levantamento> _getAtualizaDadosInventario(
      int id, String conexao) async {
    try {
      Response response = await getConexaoPrefs(conexao)
          .get("atualizaDadosLevantamentos.json?idLevantamento=$id")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });

      await db.levantamentosDao
          .updateAtualizaDados(Levantamento.fromJson(response.data["payload"]));
      return await getLevantamentoDB(id);
    } catch (error) {
      throw error;
    }
  }

  Future<Levantamento> atualizaDadosInventario(int id, String conexao) async {
    return await _getAtualizaDadosInventario(id, conexao);
  }

  Future<List<Levantamento>> _getLevantamento(
      int idOrganizacao, String conexao) async {
    try {
      Response response = await getConexaoPrefs(conexao)
          .get("obterLevantamentosPorUGV3.json?idOrganizacao=$idOrganizacao")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error;
      });

      await db.levantamentosDao
          .insertLevantamentos(response.data["payload"] as List);
      return await getLevantamentosDB(idOrganizacao);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Levantamento>> buscaLevantamento(
      int idOrganizacao, String conexao) async {
    // db.deleteTable(db.levantamentoDB);

    return await _getLevantamento(idOrganizacao, conexao);
  }
}
