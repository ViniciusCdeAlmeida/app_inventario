import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:moor/moor.dart';

/// Responsável por criar a tabela [InventarioDB] e seus campos no banco de dados.
class InventarioDB extends Table {
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
