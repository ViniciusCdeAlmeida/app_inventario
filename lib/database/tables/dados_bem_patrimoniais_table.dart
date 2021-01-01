import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:moor/moor.dart';

/// Responsável por criar a tabela [DadosBemPatrimoniaisDB] e seus campos no banco de dados.
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
