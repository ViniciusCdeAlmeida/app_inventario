///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de [Dominio] ou de uma [String] em um objeto [Dominio].
Dominio helperDominio(dynamic dominio) {
  if (dominio != null) {
    return Dominio(
      id: dominio.id,
      nome: dominio.nome,
      chave: dominio.chave,
      codigo: dominio.codigo,
      descricao: dominio.descricao,
    );
  } else
    return null;
}

/// Converte o resultado de uma lista de [DominioDBData] em uma lista [Dominio].
List<Dominio> helperDominioLista(List<DominioDBData> listaDominios) {
  return List<Dominio>.from(
    (listaDominios).map(
      (item) => Dominio(
        id: item.id,
        nome: item.nome,
        chave: item.chave,
        codigo: item.codigo,
        descricao: item.descricao,
      ),
    ),
  );
}
