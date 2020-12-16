import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'conexao_dao.g.dart';

@UseDao(tables: [
  ConexaoDB,
])
class ConexaoDao extends DatabaseAccessor<AppDatabase> with _$ConexaoDaoMixin {
  final AppDatabase db;

  ConexaoDao(this.db) : super(db);

  Future<int> insertConexao(Conexao conexao) async => into(conexaoDB).insert(
        ConexaoDBCompanion(
          ativo: Value(conexao.ativo),
          nome: Value(conexao.nome),
          url: Value(conexao.url),
        ),
      );

  Future<List<ConexaoDBData>> getConexoes() => (select(db.conexaoDB)).get();

  Future<ConexaoDBData> getConexao(int id) => (select(db.conexaoDB)
        ..where(
          (tbl) => tbl.id.equals(id),
        ))
      .getSingle();

  Future<ConexaoDBData> getConexaoAtiva() => (select(db.conexaoDB)
        ..where(
          (tbl) => tbl.ativo.equals(true),
        ))
      .getSingle();

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

  Future updateDesativaConexoes() => (update(conexaoDB)).write(
        ConexaoDBCompanion(
          ativo: Value(false),
        ),
      );

  Future deleteConexao(int id) => (delete(conexaoDB)
        ..where(
          (tbl) => tbl.id.equals(id),
        ))
      .go();
}
