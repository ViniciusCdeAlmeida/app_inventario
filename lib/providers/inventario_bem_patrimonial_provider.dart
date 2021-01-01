import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/main.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/utils/index_utils.dart';

class InventarioBensPatrimoniaisProvider {
  bool _isLoading = false;
  List<InventarioBemPatrimonial> _inventariados = [];

  bool get isLoading => _isLoading;

  List<InventarioBemPatrimonial> get getInventariados {
    return [..._inventariados];
  }

  Future<List<InventarioBemPatrimonial>> buscaBensInventariados(
          int idUnidade) async =>
      helperInventarioBemPatrimonialLista(
          await db.inventarioBemPatrimonialDao.getInventariados(idUnidade));

  Future<void> _enviaDados(List<InventarioBemPatrimonial> bensColetados) async {
    List itens = bensColetados
        .where((element) => element.enviado == false)
        .map((e) => e.toJson())
        .toList();

    try {
      await Endpoint.getSaveInventario(itens)
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

  Future<void> enviaDados(List<InventarioBemPatrimonial> bensColetados) async =>
      await _enviaDados(bensColetados);

  Future<void> gravaDados(InventarioBemPatrimonial item) async =>
      await _gravaDados(item);
}
