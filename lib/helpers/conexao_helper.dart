import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

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
