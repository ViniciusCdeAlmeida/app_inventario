import 'package:GRPInventario/models/database/databaseMoor.dart';
import 'package:GRPInventario/models/database/tables/index.dart';
import 'package:GRPInventario/models/serialized/index.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'usuarioDao.g.dart';

@UseDao(tables: [
  UsuarioDB,
])
class UsuarioDao extends DatabaseAccessor<AppDatabase> with _$UsuarioDaoMixin {
  final AppDatabase db;

  UsuarioDao(this.db) : super(db);

  Future<void> insertUsuario() async {
    into(usuarioDB).insert(
      UsuarioDBCompanion(
        username: Value('usuario APP'),
      ),
    );
  }

  Future<UsuarioDBData> getUsuario() => (select(db.usuarioDB)).getSingle();

  Future updateUsuario(List<Organizacoes> organizacoes) {
    return (update(usuarioDB)
          ..where(
            (tbl) => tbl.id.equals(1),
          ))
        .write(
      UsuarioDBCompanion(
        organizacoes: Value(organizacoes),
      ),
    );
  }
}
