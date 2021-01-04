import 'package:dio/dio.dart';

import 'package:GRPInventario/main.dart';

import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/utils/index_utils.dart';
import 'package:GRPInventario/models/index_models.dart';

class EstruturaLevantamentoProvider {
  Future<List<EstruturaInventario>> buscaPorEstrutura(int id) async =>
      helperEstruturaInventarioLista(
          await db.estruturaInventarioDao.getAllEstruturasPorLevantamento(id));

  Future<BemPatrimonial> buscaBensPorId(String numeroBemPatrimonial,
      String idInventario, int idUnidade, String idBem) async {
    BemPatrimonial _bemPatrimonial;
    _bemPatrimonial = helperBemPatrimonial(
        await db.bemPatrimoniaisDao.getBemPatrimonial(numeroBemPatrimonial));
    _bemPatrimonial.dadosBensPatrimoniais = helperDadoBemPatrimonial(
        await db.dadosBemPatrimoniaisDao.getDadosInventariar(
            numeroBemPatrimonial.toUpperCase(), idInventario, idUnidade));
    return _bemPatrimonial;
  }

  Future<void> _getLevantamento(int idLevantamento) async {
    try {
      final filter = {
        "start": 1,
        "dir": "asc",
        "sort": "id",
        "limit": 1000000,
        "filters": [
          {
            "type": "numeric",
            "field": "inventario.id",
            "value": idLevantamento,
          },
        ],
      };
      Response response =
          await Endpoint.getInventarioEstruturaOrganizacional(filter)
              .timeout(
        Duration(minutes: 5),
      )
              .catchError((error) {
        throw error.error.message == "Connection failed"
            ? "Falha de conexão."
            : error.error.message;
      });

      // _nomeEstrutura = (response.data["objects"] as List<dynamic>)
      //     .first["inventario"]["codigoENome"];

      await db.estruturaInventarioDao
          .insertEstruturaInventario((response.data["objects"] as List));
    } catch (error) {
      throw error;
    }
  }

  Future<void> buscaEstruturas(List<Inventario> listLevantamento) async {
    // _estruturas.clear();

    db.deleteTable(db.estruturaInventarioDB);
    db.deleteTable(db.dadosBemPatrimoniaisDB);
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(element.id))
        .toList()
        .whenComplete(
      () {
        // _nomeEstrutura = null;
      },
    );
  }
}
