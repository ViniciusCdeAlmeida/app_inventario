///{@category Helpers}
import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de uma lista de [InventarioDBData] em uma lista [Inventario].
List<Inventario> helperInventarioList(
    List<InventarioDBData> listaLevantamento) {
  return List<Inventario>.from(
    (listaLevantamento).map(
      (item) => Inventario(
        id: item.id,
        codigo: item.codigo,
        codigoENome: item.codigoENome,
        idOrganizacao: item.id,
        nome: item.nome,
        quantidadeEstruturas: item.quantidadeEstruturas,
        quantidadeTotalBens: item.quantidadeTotalBens,
        quantidadeTotalBensTratados: item.quantidadeTotalBensTratados,
        quantidadeTotalBensEmInconsistencia:
            item.quantidadeTotalBensEmInconsistencia,
        quantidadeTotalBensSemInconsistencia:
            item.quantidadeTotalBensSemInconsistencia,
        quantidadeTotalBensBaixados: item.quantidadeTotalBensBaixados,
        dominioStatusInventario: helperDominio(item.dominioStatusInventario),
        dominioTipoInventario: helperDominio(item.dominioTipoInventario),
      ),
    ),
  );
}

/// Converte [InventarioDBData] em um objeto [Inventario].
Inventario helperInventario(InventarioDBData levantamento) {
  if (levantamento != null) {
    return Inventario(
      id: levantamento.id,
      codigo: levantamento.codigo,
      codigoENome: levantamento.codigoENome,
      idOrganizacao: levantamento.id,
      nome: levantamento.nome,
      quantidadeEstruturas: levantamento.quantidadeEstruturas,
      quantidadeTotalBens: levantamento.quantidadeTotalBens,
      quantidadeTotalBensTratados: levantamento.quantidadeTotalBensTratados,
      quantidadeTotalBensEmInconsistencia:
          levantamento.quantidadeTotalBensEmInconsistencia,
      quantidadeTotalBensSemInconsistencia:
          levantamento.quantidadeTotalBensSemInconsistencia,
      quantidadeTotalBensBaixados: levantamento.quantidadeTotalBensBaixados,
      dominioStatusInventario:
          helperDominio(levantamento.dominioStatusInventario),
      dominioTipoInventario: helperDominio(levantamento.dominioTipoInventario),
    );
  } else
    return null;
}
