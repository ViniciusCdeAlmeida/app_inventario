import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';

Organizacoes helperOrganizacoes(UnidadesGestorasDBData organizacoes) {
  if (organizacoes != null) {
    return Organizacoes(
      id: organizacoes.id,
      organizacao: organizacoes.organizacao,
    );
  } else
    return null;
}

List<Organizacoes> helperOrganizacoesLista(
    List<UnidadesGestorasDBData> organizacoes) {
  if (organizacoes != null) {
    return List<Organizacoes>.from(
      (organizacoes).map(
        (item) => Organizacoes(
          id: item.id,
          organizacao: item.organizacao,
        ),
      ),
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
