import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/material.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'bemPatrimoniaisDao.g.dart';

@UseDao(tables: [BensPatrimoniaisDB])
class BemPatrimoniaisDao extends DatabaseAccessor<AppDatabase>
    with _$BemPatrimoniaisDaoMixin {
  final AppDatabase db;

  BemPatrimoniaisDao(this.db) : super(db);

  Future<List<BensPatrimoniaisDBData>> getAllBensPatrimoniais() =>
      select(db.bensPatrimoniaisDB).get();

  Future<BensPatrimoniaisDBData> getBemPatrimonial(
          String numeroBemPatrimonial) =>
      (select(db.bensPatrimoniaisDB)
            ..where((tbl) =>
                tbl.numeroPatrimonialCompleto.equals(numeroBemPatrimonial)))
          .getSingle();

  Future<BensPatrimoniaisDBData> getVerificaBensPatrimoniais() =>
      (select(db.bensPatrimoniaisDB)..limit(1)).getSingle();

  Future<void> updateBemPatrimonial(int idBemPatrimonial) =>
      (update(db.bensPatrimoniaisDB)
            ..where(
              (tbl) => tbl.id.equals(idBemPatrimonial),
            ))
          .write(
        BensPatrimoniaisDBCompanion(
          inventariado: Value(true),
        ),
      );

  Future<void> insertBensPatrimoniais(List bensPatrimoniais) async {
    await batch(
      (l) {
        l.insertAll(
          db.bensPatrimoniaisDB,
          bensPatrimoniais.map((e) {
            List<Caracteristicas> caracteristicas =
                (e['caracteristicas'] as List)
                    .map((i) => Caracteristicas.fromJson(i))
                    .toList();
            return BensPatrimoniaisDBCompanion(
              id: Value(e['id']),
              numeroPatrimonial: Value(e['numeroPatrimonial']),
              numeroPatrimonialCompleto: Value(e['numeroPatrimonialCompleto']),
              numeroPatrimonialCompletoAntigo:
                  Value(e['numeroPatrimonialCompletoAntigo']),
              dominioSituacaoFisica: Value(
                Dominio.fromJson(e['dominioSituacaoFisica']),
              ),
              dominioStatus: Value(
                Dominio.fromJson(e['dominioStatus']),
              ),
              estruturaOrganizacionalAtual: Value(
                Organizacao.fromJson(e['estruturaOrganizacionalAtual']),
              ),
              material: Value(
                Material.fromJson(e['material']),
              ),
              caracteristicas: caracteristicas != null
                  ? Value(caracteristicas)
                  : Value(null),
            );
          }).toList(),
        );
      },
    );
  }
}
