import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';

import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:GRPInventario/database/daos/index_daos.dart';

part 'database_moor.g.dart';

/// Agrega todas as tabelas e daos para serem usados.
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

/// Configurações do banco de dados MOOR
///
/// É usado o tipo LAZY para aumentar o desempenho da aplicação com a integração com o banco.
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((LazyDatabase(
          () async {
            final dbFolder = await getDatabasesPath();
            final file = File(p.join(dbFolder, 'db.sqlite'));
            return VmDatabase(file);
          },
        )));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        beforeOpen: (usuarioDB) async {
          if (usuarioDB.wasCreated) {
            usuarioDao.insertUsuario();
          }
        },
      );

  /// Apaga os registros de tabela [table] especifica.
  void deleteTable(TableInfo table) => delete(table).go();

  /// Apaga todos os registros de todas as [tables].
  void deleteTables(List<TableInfo> tables) {
    for (var table in tables) {
      delete(table).go();
    }
  }
}
