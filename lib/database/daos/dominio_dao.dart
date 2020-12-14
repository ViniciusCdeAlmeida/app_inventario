import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'dominio_dao.g.dart';

@UseDao(tables: [DominioDB])
class DominioDao extends DatabaseAccessor<AppDatabase> with _$DominioDaoMixin {
  final AppDatabase db;

  DominioDao(this.db) : super(db);

  Future<List<DominioDBData>> getAllDominio() => select(db.dominioDB).get();

  Future<DominioDBData> getVerificaDominios() =>
      (select(db.dominioDB)..limit(1)).getSingle();

  Future<List<DominioDBData>> getDominioBens(String chave) async =>
      await (select(db.dominioDB)
            ..where(
              (tbl) => tbl.chave.equals(chave),
            ))
          .get();

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
