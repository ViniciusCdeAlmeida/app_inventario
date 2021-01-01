///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte [UsuarioDBData] em um objeto [Login].
Login helperLogin(UsuarioDBData login) {
  return Login(
    id: login.id,
    organizacoes: login.organizacoes,
    username: login.username,
  );
}
