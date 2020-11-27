import 'package:GRPInventario/models/database/databaseMoor.dart';
import 'package:GRPInventario/models/serialized/index.dart';

Mascara helperMascara(MascaraNumeroPatrimonialDBData mascara) {
  if (mascara != null) {
    return Mascara(
      id: mascara.id,
      mascara: mascara.mascara,
    );
  } else
    return null;
}
