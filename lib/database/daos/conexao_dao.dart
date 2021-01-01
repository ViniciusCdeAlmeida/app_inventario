import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'conexao_dao.g.dart';

@UseDao(tables: [ConexaoDB])

/// Classe responsável por gerar as operações de banco de dados da tabela [ConexaoDB].
class ConexaoDao extends DatabaseAccessor<AppDatabase> with _$ConexaoDaoMixin {
  final AppDatabase db;

  ConexaoDao(this.db) : super(db);

  /// Método responsável por inserir uma conexao no banco de dados.
  Future<int> insertConexao(Conexao conexao) async => into(conexaoDB).insert(
        ConexaoDBCompanion(
          ativo: Value(conexao.ativo),
          nome: Value(conexao.nome),
          url: Value(conexao.url),
        ),
      );

  /// Método responsável por buscar todas as conexões.
  Future<List<ConexaoDBData>> getConexoes() => (select(db.conexaoDB)).get();

  Future<ConexaoDBData> getConexao(int id) => (select(db.conexaoDB)
        ..where(
          (tbl) => tbl.id.equals(id),
        ))
      .getSingle();

  /// Método responsável por verificar se existe uma conexão ativa.
  Future<ConexaoDBData> getConexaoAtiva() => (select(db.conexaoDB)
        ..where(
          (tbl) => tbl.ativo.equals(true),
        ))
      .getSingle();

  /// Método responsável por atualizar um conexão.
  Future updateConexao(Conexao conexao) => (update(conexaoDB)
            ..where(
              (tbl) => tbl.id.equals(conexao.id),
            ))
          .write(
        ConexaoDBCompanion(
          ativo: Value(conexao.ativo),
          nome: Value(conexao.nome),
          url: Value(conexao.url),
        ),
      );

  /// Método responsável por desativar todas as conexões existentes.
  Future updateDesativaConexoes() => (update(conexaoDB)).write(
        ConexaoDBCompanion(
          ativo: Value(false),
        ),
      );

  /// Método responsável por remover uma conexão.
  Future deleteConexao(int id) => (delete(conexaoDB)
        ..where(
          (tbl) => tbl.id.equals(id),
        ))
      .go();
}
