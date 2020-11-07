import 'package:app_inventario/custom/conexao.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/main.dart';

class InventarioBensPatrimoniais with ChangeNotifier {
  bool _isLoading = false;
  List<InventarioBemPatrimonial> _inventariados = [];

  bool get isLoading => _isLoading;

  List<InventarioBemPatrimonial> get getInventariados {
    return [..._inventariados];
  }

  Future<List<InventarioBemPatrimonial>> buscaBensInventariados(
      int idUnidade) async {
    return helperInventarioBemPatrimonialLista(
        await db.inventarioBemPatrimonialDao.getInventariados(idUnidade));
  }

  Future<void> _enviaDados(
      String conexao, List<InventarioBemPatrimonial> bensColetados) async {
    List itens = bensColetados
        .where((element) => element.enviado == false)
        .map((e) => e.toJson())
        .toList();

    try {
      await getConexaoPrefs(conexao)
          .post("saveInventarioBemPatrimonialMobile.json", data: itens)
          .timeout(
            Duration(seconds: 50),
          )
          .catchError((error) {
        throw error.error.message == "Connection failed"
            ? "Falha de conexão."
            : error.error.message;
      });
      itens
          .map((e) async => await db.inventarioBemPatrimonialDao
              .updateDadosInventariado(e['numeroPatrimonial']))
          .toList();
    } catch (error) {
      throw error;
    }
  }

  Future _gravaDados(InventarioBemPatrimonial bemPatrimonial) async {
    await db.inventarioBemPatrimonialDao
        .insertInventarioBensPatrimoniais(bemPatrimonial);

    await db.dadosBemPatrimoniaisDao
        .updateDadosBemPatrimonial(bemPatrimonial.idDadosBemPatrimonialMobile);
    await db.bemPatrimoniaisDao
        .updateBemPatrimonial(bemPatrimonial.idDadosBemPatrimonialMobile);
  }

  Future<void> enviaDados(
      String conexao, List<InventarioBemPatrimonial> bensColetados) async {
    await _enviaDados(conexao, bensColetados);
  }

  Future<void> gravaDados(InventarioBemPatrimonial item) async {
    await _gravaDados(item);
  }
}
