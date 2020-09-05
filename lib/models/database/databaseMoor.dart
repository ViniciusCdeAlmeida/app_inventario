import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/converters/caracteristicasConverter.dart';
import 'package:app_inventario/models/converters/dominioConverter.dart';
import 'package:app_inventario/models/converters/materialConverter.dart';
import 'package:app_inventario/models/converters/organizacaoConverter.dart';
import 'package:app_inventario/models/converters/inventarioBemPatrimonialConverter.dart';
import 'package:app_inventario/models/converters/dadosBensPatrimoniaisConverter.dart';

import 'package:app_inventario/models/database/daos/bemPatrimoniaisDao.dart';
import 'package:app_inventario/models/database/daos/dominioDao.dart';
import 'package:app_inventario/models/database/daos/dadosBemPatrimoniaisDao.dart';
import 'package:app_inventario/models/database/daos/estruturaInventarioDao.dart';
import 'package:app_inventario/models/database/daos/levantamentosDao.dart';
import 'package:app_inventario/models/database/daos/unidadesGestorasDao.dart';
import 'package:app_inventario/models/database/daos/inventarioBemPatrimonialDao.dart';

import 'package:app_inventario/models/serialized/material.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:app_inventario/models/serialized/inventarioDadosBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';

part 'databaseMoor.g.dart';

class DominioDB extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text()();
  TextColumn get chave => text()();
  IntColumn get codigo => integer()();
}

class UnidadesGestorasDB extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get organizacao =>
      text().map(const OrganizacaoConverter()).nullable()();
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
  TextColumn get dadosBensPatrimoniais =>
      text().map(const BemPatrimonialDadosConverter()).nullable()();
  BoolColumn get inventariado => boolean().withDefault(const Constant(false))();
}

class InventarioBemPatrimonialDB extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get idDadosBemPatrimonialMobile => integer().nullable()();
  IntColumn get idInventarioEstruturaOrganizacionalMobile =>
      integer().nullable()();
  IntColumn get idUnidadeOrganizacional => integer().nullable()();
  TextColumn get numeroPatrimonial => text().nullable()();
  TextColumn get numeroPatrimonialAntigo => text().nullable()();
  TextColumn get numeroPatrimonialNovo => text().nullable()();
  TextColumn get nomeUsuarioColeta => text().nullable()();
  TextColumn get tipoMobile => text().nullable()();
  BoolColumn get novoBemInvetariado => boolean().nullable()();
  BoolColumn get enviado => boolean().nullable()();
  BoolColumn get bemNaoEncontrado => boolean().nullable()();
  BoolColumn get bemNaoInventariado => boolean().nullable()();
  TextColumn get caracteristicas =>
      text().map(const CaracteristicasConverter()).nullable()();
  TextColumn get material => text().map(const MaterialConverter()).nullable()();
  TextColumn get dominioSituacaoFisica =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatus =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatusInventarioBem =>
      text().map(const DominioConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {numeroPatrimonial};
}

class ConexaoDB extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text().nullable()();
  TextColumn get url => text().nullable()();
  BoolColumn get ativo => boolean().nullable()();
}

class LevantamentoDB extends Table {
  IntColumn get id => integer()();
  IntColumn get idOrganizacao => integer().nullable()();
  TextColumn get nome => text().nullable()();
  TextColumn get codigoENome => text().nullable()();
  TextColumn get codigo => text().nullable()();
  TextColumn get dominioTipoInventario =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatusInventario =>
      text().map(const DominioConverter()).nullable()();
  IntColumn get quantidadeEstruturas => integer().nullable()();
  IntColumn get quantidadeTotalBens => integer().nullable()();
  IntColumn get quantidadeTotalBensTratados => integer().nullable()();
  IntColumn get quantidadeTotalBensEmInconsistencia => integer().nullable()();
  IntColumn get quantidadeTotalBensSemInconsistencia => integer().nullable()();
  IntColumn get quantidadeTotalBensBaixados => integer().nullable()();
}

class EstruturaInventarioDB extends Table {
  IntColumn get id => integer()();
  IntColumn get idInventario => integer().nullable()();
  TextColumn get dominioStatusInventarioEstrutura =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get estruturaOrganizacional =>
      text().map(const OrganizacaoConverter()).nullable()();
}

class DadosBemPatrimoniaisDB extends Table {
  IntColumn get id => integer()();
  IntColumn get idInventario => integer().nullable()();
  TextColumn get material => text().map(const MaterialConverter()).nullable()();
  TextColumn get dominioSituacaoFisica =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatus =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get dominioStatusInventarioBem =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get estruturaOrganizacionalAtual =>
      text().map(const OrganizacaoConverter()).nullable()();
  TextColumn get inventarioBemPatrimonial =>
      text().map(const InventarioBemPatrimonialConverter()).nullable()();
  IntColumn get idEstruturaOrganizacional => integer().nullable()();
  IntColumn get idBemPatrimonial => integer().nullable()();
  TextColumn get numeroPatrimonialCompleto => text().nullable()();
  BoolColumn get inventariado => boolean().withDefault(const Constant(false))();
}

@UseMoor(
  tables: [
    DominioDB,
    BensPatrimoniaisDB,
    EstruturaInventarioDB,
    LevantamentoDB,
    ConexaoDB,
    UnidadesGestorasDB,
    DadosBemPatrimoniaisDB,
    InventarioBemPatrimonialDB
  ],
  daos: [
    DominioDao,
    BemPatrimoniaisDao,
    LevantamentosDao,
    EstruturaInventarioDao,
    UnidadesGestorasDao,
    DadosBemPatrimoniaisDao,
    InventarioBemPatrimonialDao
  ],
)
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
  int get schemaVersion => 13;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (m, from, to) {
          // m.createTable(unidadesGestorasDB);
          // m.addColumn(dadosBemPatrimoniaisDB, dadosBemPatrimoniaisDB.inventarioBemPatrimonial);inventariado
          // m.drop(inventarioBemPatrimonialDB);
          return m.addColumn(
              dadosBemPatrimoniaisDB, dadosBemPatrimoniaisDB.inventariado);
        },
      );

  void deleteTable(TableInfo table) => delete(table).go();
}
