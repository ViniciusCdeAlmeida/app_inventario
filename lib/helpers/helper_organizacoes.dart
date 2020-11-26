import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/index.dart';

Organizacoes helperOrganizacoes(UnidadesGestorasDBData organizacoes) {
  if (organizacoes != null) {
    return Organizacoes(
      id: organizacoes.id,
      organizacao: organizacoes.organizacao,
    );
  } else
    return null;
}

List<Organizacoes> helperOrganizacoesListaDB(
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

List<Organizacoes> helperOrganizacoesLista(List organizacoes) {
  if (organizacoes != null) {
    return List<Organizacoes>.from(
      (organizacoes).map(
        (item) => Organizacoes(
          id: item['id'],
          organizacao: Organizacao.fromJson(item['organizacao'] as Map),
        ),
      ),
    );
  } else
    return null;
}
