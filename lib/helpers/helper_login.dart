import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/index.dart';

Login helperLogin(UsuarioDBData login) {
  return Login(
    id: login.id,
    organizacoes: login.organizacoes,
    username: login.username,
  );
}
