import 'package:app_inventario/models/converters/index.dart';
import 'package:moor/moor.dart';

class UnidadesGestorasDB extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get organizacao =>
      text().map(const OrganizacaoConverter()).nullable()();
}