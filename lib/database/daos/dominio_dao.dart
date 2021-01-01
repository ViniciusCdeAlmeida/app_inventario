import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'dominio_dao.g.dart';

@UseDao(tables: [DominioDB])

/// Classe responsável por gerar as operações de banco de dados da tabela [DominioDB].
class DominioDao extends DatabaseAccessor<AppDatabase> with _$DominioDaoMixin {
  final AppDatabase db;

  DominioDao(this.db) : super(db);

  /// Método responsável por buscar todos os dominios.
  Future<List<DominioDBData>> getAllDominio() => select(db.dominioDB).get();

  /// Método responsável por verificar a existência de dominios.
  Future<DominioDBData> getVerificaDominios() =>
      (select(db.dominioDB)..limit(1)).getSingle();

  /// Método responsável por inserir uma lista de dominios no banco de dados.
  Future<void> insertDominio(List dominio) async => await batch((l) {
        l.insertAll(
            db.dominioDB,
            dominio
                .map(
                  (e) => DominioDBCompanion(
                    chave: Value(e['chave']),
                    codigo: Value(e['codigo']),
                    descricao: Value(e['descricao']),
                    id: Value(e['id']),
                    nome: Value(e['nome']),
                  ),
                )
                .toList());
      });
}
