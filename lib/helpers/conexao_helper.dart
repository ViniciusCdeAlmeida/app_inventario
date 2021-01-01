///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de uma lista de [ConexaoDBData] em uma lista [Conexao].
List<Conexao> helperConexoes(List<ConexaoDBData> conexoes) {
  if (conexoes != null) {
    return List<Conexao>.from(
      (conexoes).map(
        (item) => Conexao(
          id: item.id,
          ativo: item.ativo,
          nome: item.nome,
          url: item.url,
        ),
      ),
    );
  } else
    return null;
}

/// Converte [ConexaoDBData] em um objeto [Conexao].
Conexao helperConexao(ConexaoDBData conexao) {
  if (conexao != null) {
    return Conexao(
      id: conexao.id,
      ativo: conexao.ativo,
      nome: conexao.nome,
      url: conexao.url,
    );
  } else
    return null;
}
