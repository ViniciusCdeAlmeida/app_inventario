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
        dominioStatusInventario: Dominio(
          id: item['dominioStatusInventario']['id'],
          nome: item['dominioStatusInventario']['nome'],
          descricao: item['dominioStatusInventario']['descricao'],
          chave: item['dominioStatusInventario']['chave'],
          codigo: item['dominioStatusInventario']['codigo'],
        ),
        dominioTipoInventario: Dominio(
          id: item['dominioTipoInventario']['id'],
          nome: item['dominioTipoInventario']['nome'],
          descricao: item['dominioTipoInventario']['descricao'],
          chave: item['dominioTipoInventario']['chave'],
          codigo: item['dominioTipoInventario']['codigo'],
        ),
      ),
    ),
  );
}

Levantamento helperLevantamento(dynamic levantamento) {
  // if (dominio != null) {
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
    dominioStatusInventario: Dominio(
      id: levantamento['dominioStatusInventario']['id'],
      nome: levantamento['dominioStatusInventario']['nome'],
      descricao: levantamento['dominioStatusInventario']['descricao'],
      chave: levantamento['dominioStatusInventario']['chave'],
      codigo: levantamento['dominioStatusInventario']['codigo'],
    ),
    dominioTipoInventario: Dominio(
      id: levantamento['dominioTipoInventario']['id'],
      nome: levantamento['dominioTipoInventario']['nome'],
      descricao: levantamento['dominioTipoInventario']['descricao'],
      chave: levantamento['dominioTipoInventario']['chave'],
      codigo: levantamento['dominioTipoInventario']['codigo'],
    ),
  );
}
