import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/database/tables/dominio.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'unidadesGestorasDao.g.dart';

@UseDao(tables: [DominioDB])
class UnidadesGestorasDao extends DatabaseAccessor<AppDatabase>
    with _$UnidadesGestorasDaoMixin {
  final AppDatabase db;

  UnidadesGestorasDao(this.db) : super(db);

  Future<List<UnidadesGestorasDBData>> getAllUnidades() =>
      select(db.unidadesGestorasDB).get();

  Future<UnidadesGestorasDBData> getVerificaUnidades() =>
      (select(db.unidadesGestorasDB)..limit(1)).getSingle();

  Future<void> insertUnidadeGestora(List unidade) async {
    await batch((l) {
      l.insertAll(
          db.unidadesGestorasDB,
          unidade
              .map(
                (item) => UnidadesGestorasDBCompanion(
                  id: Value(item['id']),
                  organizacao: Value(Organizacao.fromJson(item['organizacao'])),
                ),
              )
              .toList());
    });
  }
}
