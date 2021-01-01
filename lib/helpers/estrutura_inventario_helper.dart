///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de uma lista de [EstruturaInventarioDBData] em uma lista [EstruturaInventario].
List<EstruturaInventario> helperEstruturaInventarioLista(
    List<EstruturaInventarioDBData> listaUnidades) {
  return List<EstruturaInventario>.from(
    (listaUnidades).map(
      (item) => EstruturaInventario(
          id: item.id,
          dominioStatusInventarioEstrutura:
              item.dominioStatusInventarioEstrutura,
          estruturaOrganizacional: item.estruturaOrganizacional,
          idInventario: item.idInventario),
    ),
  );
}
