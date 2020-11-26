import 'package:app_inventario/models/converters/caracteristicasConverter.dart';
import 'package:app_inventario/models/converters/dadosBensPatrimoniaisConverter.dart';
import 'package:app_inventario/models/converters/dominioConverter.dart';
import 'package:app_inventario/models/converters/materialConverter.dart';
import 'package:app_inventario/models/converters/organizacaoConverter.dart';
import 'package:moor/moor.dart';

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
