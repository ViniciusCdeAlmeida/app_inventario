import 'package:GRPInventario/models/converters/organizacoesConverter.dart';
import 'package:moor/moor.dart';

class UsuarioDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().nullable()();
  TextColumn get organizacoes =>
      text().map(const OrganizacoesConverter()).nullable()();
}
