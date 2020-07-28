import 'package:app_inventario/models/dominio.dart';
import '../models/levantamento.dart';

List<Levantamento> helperLevantamento(List listaLevantamento) {
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
