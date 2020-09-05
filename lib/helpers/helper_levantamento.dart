import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';

List<Levantamento> helperLevantamentoList(
    List<LevantamentoDBData> listaLevantamento) {
  return List<Levantamento>.from(
    (listaLevantamento).map(
      (item) => Levantamento(
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

Levantamento helperLevantamento(LevantamentoDBData levantamento) {
  if (levantamento != null) {
    return Levantamento(
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
