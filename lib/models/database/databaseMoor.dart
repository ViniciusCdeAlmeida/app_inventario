import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';

import 'package:app_inventario/models/database/tables/dadosBemPatrimoniais.dart';
import 'package:app_inventario/models/database/tables/bensPatrimoniais.dart';
import 'package:app_inventario/models/database/tables/conexao.dart';
import 'package:app_inventario/models/database/tables/dominio.dart';
import 'package:app_inventario/models/database/tables/estruturaInventario.dart';
import 'package:app_inventario/models/database/tables/inventario.dart';
import 'package:app_inventario/models/database/tables/inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/database/tables/mascara.dart';
import 'package:app_inventario/models/database/tables/prefixo.dart';
import 'package:app_inventario/models/database/tables/unidadesGestoras.dart';
import 'package:app_inventario/models/database/tables/usuario.dart';

import 'package:app_inventario/models/serialized/material.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:app_inventario/models/serialized/inventarioDadosBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';

import 'package:app_inventario/models/converters/caracteristicasConverter.dart';
import 'package:app_inventario/models/converters/dominioConverter.dart';
import 'package:app_inventario/models/converters/materialConverter.dart';
import 'package:app_inventario/models/converters/organizacaoConverter.dart';
import 'package:app_inventario/models/converters/organizacoesConverter.dart';
import 'package:app_inventario/models/converters/inventarioBemPatrimonialConverter.dart';
import 'package:app_inventario/models/converters/dadosBensPatrimoniaisConverter.dart';

import 'package:app_inventario/models/database/daos/bemPatrimoniaisDao.dart';
import 'package:app_inventario/models/database/daos/dominioDao.dart';
import 'package:app_inventario/models/database/daos/dadosBemPatrimoniaisDao.dart';
import 'package:app_inventario/models/database/daos/estruturaInventarioDao.dart';
import 'package:app_inventario/models/database/daos/inventariosDao.dart';
import 'package:app_inventario/models/database/daos/unidadesGestorasDao.dart';
import 'package:app_inventario/models/database/daos/inventarioBemPatrimonialDao.dart';
import 'package:app_inventario/models/database/daos/conexaoDao.dart';
import 'package:app_inventario/models/database/daos/configuracaoDao.dart';
import 'package:app_inventario/models/database/daos/usuarioDao.dart';

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
