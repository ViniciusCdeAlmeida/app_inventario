import 'package:GRPInventario/models/database/databaseMoor.dart';
import 'package:GRPInventario/models/serialized/index.dart';

Prefixo helperPrefixo(PrefixoDBData prefixo) {
  if (prefixo != null) {
    return Prefixo(
      id: prefixo.id,
      prefixo: prefixo.prefixo,
    );
  } else
    return null;
}
