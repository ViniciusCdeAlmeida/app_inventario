import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';

import 'package:app_inventario/models/database/tables/index.dart';

import 'package:app_inventario/models/serialized/index.dart';

import 'package:app_inventario/models/converters/index.dart';

import 'package:app_inventario/models/database/daos/index.dart';

part 'databaseMoor.g.dart';

@UseMoor(
  tables: [
    DominioDB,
    BensPatrimoniaisDB,
    EstruturaInventarioDB,
    InventarioDB,
    ConexaoDB,
    UnidadesGestorasDB,
    DadosBemPatrimoniaisDB,
    InventarioBemPatrimonialDB,
    MascaraNumeroPatrimonialDB,
    PrefixoDB,
    UsuarioDB
  ],
  daos: [
    DominioDao,
    BemPatrimoniaisDao,
    InventariosDao,
    EstruturaInventarioDao,
    UnidadesGestorasDao,
    DadosBemPatrimoniaisDao,
    InventarioBemPatrimonialDao,
    ConfiguracaoDao,
    UsuarioDao,
    ConexaoDao
  ],
)
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          (
              // FlutterQueryExecutor.inDatabaseFolder(
              // path: 'db.sqlite',
              // // Good for debugging - prints SQL in the console
              // // logStatements: true,
              LazyDatabase(
            () async {
              final dbFolder = await getDatabasesPath();
              final file = File(p.join(dbFolder, 'db.sqlite'));
              return VmDatabase(file);
            },
          )),
        );

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 16;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (m, from, to) {
          // m.createTable(unidadesGestorasDB);
          // m.addColumn(dadosBemPatrimoniaisDB, dadosBemPatrimoniaisDB.inventarioBemPatrimonial);inventariado
          // m.drop(inventarioBemPatrimonialDB);
          // m.addColumn(inventarioBemPatrimonialDB,
          //     inventarioBemPatrimonialDB.idDominioSituacaoFisica);
          // m.addColumn(inventarioBemPatrimonialDB,
          //     inventarioBemPatrimonialDB.idDominioStatus);
          // m.addColumn(inventarioBemPatrimonialDB,
          //     inventarioBemPatrimonialDB.idMaterial);
          // m.addColumn(inventarioBemPatrimonialDB,
          //     inventarioBemPatrimonialDB.idEstruturaOrganizacionalAtual);

          m.createTable(mascaraNumeroPatrimonialDB);
          return m.createTable(prefixoDB);
        },
        beforeOpen: (usuarioDB) async {
          if (usuarioDB.wasCreated) usuarioDao.insertUsuario();
        },
      );

  void deleteTable(TableInfo table) => delete(table).go();
}
