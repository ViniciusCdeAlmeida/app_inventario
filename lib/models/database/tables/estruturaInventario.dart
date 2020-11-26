import 'package:app_inventario/models/converters/dominioConverter.dart';
import 'package:app_inventario/models/converters/organizacaoConverter.dart';
import 'package:moor/moor.dart';

class EstruturaInventarioDB extends Table {
  IntColumn get id => integer()();
  IntColumn get idInventario => integer().nullable()();
  TextColumn get dominioStatusInventarioEstrutura =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get estruturaOrganizacional =>
      text().map(const OrganizacaoConverter()).nullable()();
}
