import 'package:app_inventario/helpers/index.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/index.dart';

class BensProvider {
  List<DadosBensPatrimoniais> _bensPorEstrutura = [];

  Future<List<DadosBensPatrimoniais>> buscaBensPorEstrutura(
      int id, String idInventarioEstrutura) async {
    _bensPorEstrutura = helperDadosBemPatrimonialLista(
        await db.dadosBemPatrimoniaisDao.getAllDadosPorEstrutura(id));
    List<DadosBensPatrimoniais> inventariadoForaEspelho =
        helperDadosBemPatrimonialForaEspelhoLista(
            await db.inventarioBemPatrimonialDao
                .getInventariadosForaEspelho(idInventarioEstrutura),
            int.parse(idInventarioEstrutura));
    _bensPorEstrutura.addAll(inventariadoForaEspelho);
    return _bensPorEstrutura;
  }

  Future<void> atualizaItemInventariado(int id) async {
    await db.dadosBemPatrimoniaisDao.updateDadosBemPatrimonial(id);
    await db.bemPatrimoniaisDao.updateBemPatrimonial(id);
  }
}
