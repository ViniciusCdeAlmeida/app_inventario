///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte [UnidadesGestorasDBData] em um objeto [Organizacoes].
Organizacoes helperOrganizacoes(UnidadesGestorasDBData organizacoes) {
  if (organizacoes != null) {
    return Organizacoes(
      id: organizacoes.id,
      organizacao: organizacoes.organizacao,
    );
  } else
    return null;
}

/// Converte o resultado de uma lista de [UnidadesGestorasDBData] em uma lista [Organizacoes].
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

/// Converte o resultado de um [Map] vinda de um Json em uma lista [Organizacoes].
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
