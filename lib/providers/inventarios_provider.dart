import 'package:GRPInventario/utils/index_utils.dart';
import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:dio/dio.dart';
import 'package:GRPInventario/main.dart';

class InventariosProvider {
  final int idOrganizacao;
  String _nomeInventario;

  InventariosProvider({this.idOrganizacao});

  String get getNomeLevantamentos {
    return _nomeInventario;
  }

  Future<Inventario> atualizaDadosInventario(int id) async =>
      await _getAtualizaDadosInventario(id);

  Future<Inventario> atualizaDadosLevantamento(int id) async =>
      await _getAtualizaDadosLevantamento(id);

  Future<List<Inventario>> getInventariosDB(int idOrganizacao) async =>
      helperInventarioList(
          await db.inventariosDao.getAllInventarios(idOrganizacao));

  Future<Inventario> getInventarioDB(int id) async =>
      helperInventario(await db.inventariosDao.getInventario(id));

  Future<List<Inventario>> getLevantamentosDB(int idOrganizacao) async =>
      helperInventarioList(
          await db.inventariosDao.getAllLevantamentos(idOrganizacao));

  Future<Inventario> getLevantamentoDB(int id) async =>
      helperInventario(await db.inventariosDao.getLevantamento(id));

  Future<List<Inventario>> buscaInventarios(int idOrganizacao) async =>
      await _getInventarios(idOrganizacao);

  Future<List<Inventario>> buscaLevantamentos(int idOrganizacao) async =>
      await _getLevantamentos(idOrganizacao);

  Future<Inventario> buscaInventario(String codigo) async =>
      await _getInventario(codigo);

  Future<Inventario> buscaLevantamento(String codigo) async =>
      await _getLevantamento(codigo);

  void deleteInventario() => db.deleteTable(db.inventarioDB);

  Future<bool> getVerificaInventariosDB() async {
    if (helperInventario(await db.inventariosDao.getVerificaInventarios()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<bool> getVerificaLevantamentosDB() async {
    if (helperInventario(await db.inventariosDao.getVerificaLevantamentos()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<bool> verificaTipoInventario(int idInventario) async {
    if (helperInventario(
            await db.inventariosDao.getVerificaTipoInventario(idInventario)) !=
        null) {
      //TRUE = LEVANTAMENTO
      return true;
    } else
      //FALSE != LEVANTAMENTO
      return false;
  }

  Future<Inventario> _getAtualizaDadosInventario(int id) async {
    try {
      Response response = await Endpoint.getAtualizaDadosLevantamentos(id)
          .timeout(Duration(seconds: 50))
          .catchError((error) {
        throw error;
      });

      await db.inventariosDao
          .updateAtualizaDados(Inventario.fromJson(response.data["payload"]));
      return await getInventarioDB(id);
    } catch (error) {
      throw error;
    }
  }

  Future<Inventario> _getAtualizaDadosLevantamento(int id) async {
    try {
      Response response = await Endpoint.getAtualizaDadosLevantamentos(id)
          .timeout(Duration(seconds: 50))
          .catchError((error) {
        throw error;
      });

      await db.inventariosDao
          .updateAtualizaDados(Inventario.fromJson(response.data["payload"]));
      return await getLevantamentoDB(id);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Inventario>> _getLevantamentos(int idOrganizacao) async {
    try {
      Response response = await Endpoint.getObterLevantamentosUg(idOrganizacao)
          .timeout(Duration(seconds: 50))
          .catchError((error) {
        throw error;
      });

      await db.inventariosDao
          .insertLevantamentos(response.data["payload"] as List);
      return await getLevantamentosDB(idOrganizacao);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Inventario>> _getInventarios(int idOrganizacao) async {
    try {
      Response response = await Endpoint.getObterInventariosUg(idOrganizacao)
          .timeout(Duration(seconds: 50))
          .catchError((error) {
        throw error;
      });

      await db.inventariosDao
          .insertLevantamentos(response.data["payload"] as List);
      return await getInventariosDB(idOrganizacao);
    } catch (error) {
      throw error;
    }
  }

  Future<Inventario> _getInventario(String codigo) async {
    try {
      Response response =
          await Endpoint.getObterInventariosCodigo(codigo).timeout(
        Duration(seconds: 50),
      );
      Inventario _levantamento = await getInventarioDB(
          (((response.data["payload"] as List).first)["id"]));
      if (_levantamento == null) {
        db.inventariosDao.insertLevantamentos(response.data["payload"] as List);
        return await getInventarioDB(
            (((response.data["payload"] as List).first)["id"]));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<Inventario> _getLevantamento(String codigo) async {
    try {
      Response response =
          await Endpoint.getObterLevantamentosCodigo(codigo).timeout(
        Duration(seconds: 50),
      );
      Inventario _levantamento = await getInventarioDB(
          (((response.data["payload"] as List).first)["id"]));
      if (_levantamento == null) {
        db.inventariosDao.insertLevantamentos(response.data["payload"] as List);
        return await getInventarioDB(
            (((response.data["payload"] as List).first)["id"]));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }
}
