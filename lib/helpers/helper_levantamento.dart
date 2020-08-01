import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/dominio.dart';
import '../models/levantamento.dart';

List<Levantamento> helperLevantamentoList(List listaLevantamento) {
  return List<Levantamento>.from(
    (listaLevantamento).map(
      (item) => Levantamento(
        id: item['id'],
        codigo: item['codigo'],
        codigoENome: item['dataInicio'],
        idOrganizacao: item['idOrganizacao'],
        nome: item['nome'],
        quantidadeEstruturas: item['quantidadeEstruturas'],
        quantidadeTotalBens: item['quantidadeTotalBens'],
        quantidadeTotalBensTratados: item['quantidadeTotalBensTratados'],
        quantidadeTotalBensEmInconsistencia:
            item['quantidadeTotalBensEmInconsistencia'],
        quantidadeTotalBensSemInconsistencia:
            item['quantidadeTotalBensSemInconsistencia'],
        quantidadeTotalBensBaixados: item['quantidadeTotalBensBaixados'],
        dominioStatusInventario: helperDominio(item['dominioStatusInventario']),
        dominioTipoInventario: helperDominio(item['dominioTipoInventario']),
      ),
    ),
  );
}

Levantamento helperLevantamento(dynamic levantamento) {
  return Levantamento(
    id: levantamento['id'],
    codigo: levantamento['codigo'],
    codigoENome: levantamento['dataInicio'],
    idOrganizacao: levantamento['idOrganizacao'],
    nome: levantamento['nome'],
    quantidadeEstruturas: levantamento['quantidadeEstruturas'],
    quantidadeTotalBens: levantamento['quantidadeTotalBens'],
    quantidadeTotalBensTratados: levantamento['quantidadeTotalBensTratados'],
    quantidadeTotalBensEmInconsistencia:
        levantamento['quantidadeTotalBensEmInconsistencia'],
    quantidadeTotalBensSemInconsistencia:
        levantamento['quantidadeTotalBensSemInconsistencia'],
    quantidadeTotalBensBaixados: levantamento['quantidadeTotalBensBaixados'],
    dominioStatusInventario:
        helperDominio(levantamento['dominioTipoInventario']),
    dominioTipoInventario: helperDominio(levantamento['dominioTipoInventario']),
  );
}
