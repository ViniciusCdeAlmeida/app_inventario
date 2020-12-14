import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

Prefixo helperPrefixo(PrefixoDBData prefixo) {
  if (prefixo != null) {
    return Prefixo(
      id: prefixo.id,
      prefixo: prefixo.prefixo,
    );
  } else
    return null;
}
