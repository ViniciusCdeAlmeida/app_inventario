import 'package:app_inventario/models/converters/index.dart';
import 'package:moor/moor.dart';

class InventarioBemPatrimonialDB extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get idDadosBemPatrimonialMobile => integer().nullable()();
  IntColumn get idInventarioEstruturaOrganizacionalMobile =>
      integer().nullable()();
  IntColumn get idUnidadeOrganizacional => integer().nullable()();
  IntColumn get idDominioSituacaoFisica => integer().nullable()();
  IntColumn get idDominioStatus => integer().nullable()();
  IntColumn get identificaoPatrimonial => integer().nullable()();
  IntColumn get idEstruturaOrganizacionalAtual => integer().nullable()();
  IntColumn get idMaterial => integer().nullable()();
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
