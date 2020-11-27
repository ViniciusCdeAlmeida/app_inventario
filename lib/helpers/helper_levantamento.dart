import 'package:GRPInventario/helpers/index.dart';
import 'package:GRPInventario/models/database/databaseMoor.dart';
import 'package:GRPInventario/models/serialized/index.dart';

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
