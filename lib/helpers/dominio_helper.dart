import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

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
