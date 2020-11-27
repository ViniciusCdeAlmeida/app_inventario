import 'package:GRPInventario/models/database/databaseMoor.dart';
import 'package:GRPInventario/models/serialized/index.dart';

Login helperLogin(UsuarioDBData login) {
  return Login(
    id: login.id,
    organizacoes: login.organizacoes,
    username: login.username,
  );
}
