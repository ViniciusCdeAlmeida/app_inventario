import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/prefixo.dart';

Prefixo helperPrefixo(PrefixoDBData prefixo) {
  if (prefixo != null) {
    return Prefixo(
      id: prefixo.id,
      prefixo: prefixo.prefixo,
    );
  } else
    return null;
}
