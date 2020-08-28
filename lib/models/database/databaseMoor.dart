import 'package:app_inventario/models/converters/caracteristicasConverter.dart';
import 'package:app_inventario/models/converters/dominioConverter.dart';
import 'package:app_inventario/models/converters/materialConverter.dart';
import 'package:app_inventario/models/converters/organizacaoConverter.dart';

import 'package:app_inventario/models/serialized/materialGnt.dart';
import 'package:app_inventario/models/serialized/organizacaoGnt.dart';
import 'package:app_inventario/models/serialized/dominioGnt.dart';
import 'package:app_inventario/models/serialized/caracteristicasGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'databaseMoor.g.dart';

class DominioDB extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text()();
  TextColumn get chave => text()();
  IntColumn get codigo => integer()();
}

class BensPatrimoniaisDB extends Table {
  IntColumn get id => integer()();
  TextColumn get numeroPatrimonial => text().nullable()();
  TextColumn get numeroPatrimonialCompleto => text().nullable()();
  TextColumn get numeroPatrimonialCompletoAntigo => text().nullable()();
  TextColumn get dominioSituacaoFisica =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatus =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get material => text().map(const MaterialConverter()).nullable()();
  TextColumn get caracteristicas =>
      text().map(const CaracteristicasConverter()).nullable()();
  TextColumn get estruturaOrganizacionalAtual =>
      text().map(const OrganizacaoConverter()).nullable()();
}

@UseMoor(tables: [DominioDB, BensPatrimoniaisDB])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            // Good for debugging - prints SQL in the console
            // logStatements: true,
          )),
        );

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
      );

  Future<List<DominioDBData>> getAllDominio() => select(dominioDB).get();

  Future<List<BensPatrimoniaisDBData>> getAllBensPatrimoniais() =>
      select(bensPatrimoniaisDB).get();

  Future<List<DominioDBData>> getDominioBens(String chave) async {
    return await (select(dominioDB)
          ..where(
            (tbl) => tbl.chave.equals(chave),
          ))
        .get();
  }

  Future<void> insertDominio(List dominio) async {
    // delete(dominioDB).go();
    await batch((l) {
      l.insertAll(
          dominioDB,
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

  void deleteTable(TableInfo table) => delete(table).go();

  Future<void> insertBensPatrimoniais(List bensPatrimoniais) async {
    // print('gravou BENS');
    await batch(
      (l) {
        l.insertAll(
            bensPatrimoniaisDB,
            bensPatrimoniais.map((e) {
              List<CaracteristicasGnt> teste2 = (e['caracteristicas'] as List)
                  .map((i) => CaracteristicasGnt.fromJson(i))
                  .toList();
              print(teste2.runtimeType);
              return BensPatrimoniaisDBCompanion(
                id: Value(e['id']),
                numeroPatrimonial: Value(e['numeroPatrimonial']),
                numeroPatrimonialCompleto:
                    Value(e['numeroPatrimonialCompleto']),
                numeroPatrimonialCompletoAntigo:
                    Value(e['numeroPatrimonialCompletoAntigo']),
                dominioSituacaoFisica: Value(
                  DominioGnt.fromJson(e['dominioSituacaoFisica']),
                ),
                dominioStatus: Value(
                  DominioGnt.fromJson(e['dominioStatus']),
                ),
                estruturaOrganizacionalAtual: Value(
                  OrganizacaoGnt.fromJson(e['estruturaOrganizacionalAtual']),
                ),
                material: Value(
                  MaterialGnt.fromJson(e['material']),
                ),
                caracteristicas: Value(teste2),
              );
            }).toList()
            // BensPatrimoniaisDBCompanion(
            //     id: Value(e['id']),
            //     numeroPatrimonial: Value(e['numeroPatrimonial']),
            //     numeroPatrimonialCompleto:
            //         Value(e['numeroPatrimonialCompleto']),
            //     numeroPatrimonialCompletoAntigo:
            //         Value(e['numeroPatrimonialCompletoAntigo']),
            //     dominioSituacaoFisica: Value(
            //       DominioGnt.fromJson(e['dominioSituacaoFisica']),
            //     ),
            //     dominioStatus: Value(
            //       DominioGnt.fromJson(e['dominioStatus']),
            //     ),
            //     estruturaOrganizacionalAtual: Value(
            //       OrganizacaoGnt.fromJson(e['estruturaOrganizacionalAtual']),
            //     ),
            //     material: Value(
            //       MaterialGnt.fromJson(e['material']),
            //     ),
            //     caracteristicas: Value(
            //       (e['caracteristicas'] as List)
            //           .map((f) => CaracteristicasGnt.fromJson(f))
            //           .toList(),
            //     ),
            //   ),
            // )
            // .toList();
            );
      },
    );
  }
}
