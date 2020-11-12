import 'package:app_inventario/custom/conexao.dart';
import 'package:app_inventario/helpers/helper_bemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/main.dart';
import 'package:dio/dio.dart';

class Inicializacao {
  int _startFilter = 0;
  int qtdeItens = 0;
  int qtdeItensAtual = 0;
  double progress = 0;

  Map filter = {
    "start": 1,
    "dir": "asc",
    "sort": "numeroPatrimonial",
    "limit": 1000,
    "filters": []
  };

  Future<bool> getVerificaDominioDB() async {
    if (helperDominio(await db.dominioDao.getVerificaDominios()) != null) {
      return true;
    } else
      return false;
  }

  Future<bool> getVerificaBensPatrimoniaisDB() async {
    if (helperBemPatrimonial(
            await db.bemPatrimoniaisDao.getVerificaBensPatrimoniais()) !=
        null) {
      return true;
    } else
      return false;
  }

  Future<void> getDominiosDB() async {
    return helperDominioLista(await db.dominioDao.getAllDominio());
  }

  Future<void> _getDominios(String conexao) async {
    try {
      Response response = await getConexaoPrefs(conexao)
          .get("obterDominiosInventario.json")
          .timeout(
            Duration(minutes: 2),
          )
          .catchError((error) {
        throw error;
      });

      await db.dominioDao.insertDominio(response.data["payload"] as List);
    } catch (error) {
      throw error;
    }
  }

  Future<double> getBensDemanda({String conexao, int itemAtual}) async {
    int itens = 0;
    try {
      print('Buscando pagina $itemAtual:' + DateTime.now().toString());
      filter['start'] = itemAtual;
      await getConexaoPrefs(conexao)
          .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
          .then((value) {
        itens = (value.data["objects"] as List).length;
        db.bemPatrimoniaisDao
            .insertBensPatrimoniais(value.data["objects"] as List);
      });
      print('Salvo pagina $itemAtual:' + DateTime.now().toString());
    } catch (error) {
      throw error;
    }
    qtdeItensAtual = qtdeItensAtual + itens;
    return progress = qtdeItensAtual / qtdeItens;
  }

  Future _getDadosBensDemanda(String conexao) async {
    await getConexaoPrefs(conexao)
        .post("obterBensPatrimoniaisDemandaV2.json", data: filter)
        // .post("obterBensPatrimoniaisDemanda.json", data: filter)
        .then(
      (value) {
        _startFilter = value.data['totalPages'];
        qtdeItens = value.data['totalItens'];
      },
    );
  }

  Future buscaDominioInicial(String conexao) async {
    // db.deleteTable(db.dominioDB);

    await _getDominios(conexao);
  }

  Future<List> buscaBemPatrimonialInicial(String conexao) async {
    // db.deleteTable(db.bensPatrimoniaisDB);
    await _getDadosBensDemanda(conexao);
    List<dynamic> maximo = [];
    for (var i = 0; i < _startFilter; i++) {
      maximo.insert(i, i + 1);
    }
    return maximo.toList();
  }
}
