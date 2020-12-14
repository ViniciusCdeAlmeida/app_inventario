import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'usuario_dao.g.dart';

@UseDao(tables: [
  UsuarioDB,
])
class UsuarioDao extends DatabaseAccessor<AppDatabase> with _$UsuarioDaoMixin {
  final AppDatabase db;

  UsuarioDao(this.db) : super(db);

  Future<void> insertUsuario() async => into(usuarioDB).insert(
        UsuarioDBCompanion(
          username: Value('usuario APP'),
        ),
      );

  Future<UsuarioDBData> getUsuario() => (select(db.usuarioDB)).getSingle();

  Future updateUsuario(List<Organizacoes> organizacoes) => (update(usuarioDB)
            ..where(
              (tbl) => tbl.id.equals(1),
            ))
          .write(
        UsuarioDBCompanion(
          organizacoes: Value(organizacoes),
        ),
      );
}
