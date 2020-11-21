import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:dio/dio.dart';
import 'package:app_inventario/main.dart';

class Levantamentos {
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

  Future<List<Levantamento>> getLevantamentosDB(int idOrganizacao) async =>
      helperLevantamentoList(
          await db.levantamentosDao.getAllLevantamentos(idOrganizacao));

  Future<Levantamento> getLevantamentoDB(int id) async {
    return helperLevantamento(await db.levantamentosDao.getLevantamento(id));
  }

  Future<Levantamento> _getAtualizaDadosInventario(int id) async {
    try {
      Response response = await getConexaoPrefs()
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

  Future<Levantamento> atualizaDadosInventario(int id) async =>
      await _getAtualizaDadosInventario(id);

  Future<List<Levantamento>> _getLevantamentos(int idOrganizacao) async {
    try {
      Response response = await Endpoint.getObterLevantamentosUg(idOrganizacao)
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

  Future<Levantamento> _getLevantamento(String codigo) async {
    try {
      Response response =
          await Endpoint.getObterLevantamentosCodigo(codigo).timeout(
        Duration(seconds: 50),
      );
      Levantamento _levantamento = await getLevantamentoDB(
          (((response.data["payload"] as List).first)["id"]));
      if (_levantamento == null) {
        db.levantamentosDao
            .insertLevantamentos(response.data["payload"] as List);
        return await getLevantamentoDB(
            (((response.data["payload"] as List).first)["id"]));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  void deleteLevantamento() {
    db.deleteTable(db.levantamentoDB);
  }

  Future<List<Levantamento>> buscaLevantamentos(int idOrganizacao) async =>
      await _getLevantamentos(
        idOrganizacao,
      );

  Future<Levantamento> buscaLevantamento(String codigo) async {
    return await _getLevantamento(codigo);
  }
}
