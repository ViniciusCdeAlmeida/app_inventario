import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/index.dart';
import 'package:app_inventario/models/database/tables/index.dart';

part 'estruturaInventarioDao.g.dart';

@UseDao(tables: [InventarioDB])
class EstruturaInventarioDao extends DatabaseAccessor<AppDatabase>
    with _$EstruturaInventarioDaoMixin {
  final AppDatabase db;

  EstruturaInventarioDao(this.db) : super(db);

  Future<List<dynamic>> getAllEstruturas() {
    return customSelect(
        'SELECT COUNT(id) AS "amount" FROM ' +
            db.estruturaInventarioDB.actualTableName +
            ';',
        readsFrom: {db.estruturaInventarioDB}).get();
  }

  Future<List<EstruturaInventarioDBData>> getAllEstruturasPorLevantamento(
          int idInventario) =>
      (select(db.estruturaInventarioDB)
            ..where((tbl) => tbl.idInventario.equals(idInventario)))
          .get();

  Future<EstruturaInventarioDBData> getVerificaEstruturasInventario() =>
      (select(db.estruturaInventarioDB)..limit(1)).getSingle();

  Future<void> insertEstruturaInventario(List levantamentos) async {
    await batch(
      (l) {
        l.insertAll(
          db.estruturaInventarioDB,
          levantamentos.map((e) {
            db.dadosBemPatrimoniaisDao.insertDadosBensPatrimoniais(
                e['dadosBensPatrimoniais'] as List);
            return EstruturaInventarioDBCompanion(
              id: Value(e['id']),
              estruturaOrganizacional: Value(
                Organizacao.fromJson(e['estruturaOrganizacional']),
              ),
              dominioStatusInventarioEstrutura:
                  e['dominioStatusInventarioEstrutura'] != null
                      ? Value(
                          Dominio.fromJson(
                              e['dominioStatusInventarioEstrutura']),
                        )
                      : Value(null),
              idInventario: Value(
                e['idInventario'],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
