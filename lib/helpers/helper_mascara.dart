import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/mascara.dart';

Mascara helperMascara(MascaraNumeroPatrimonialDBData mascara) {
  if (mascara != null) {
    return Mascara(
      id: mascara.id,
      mascara: mascara.mascara,
    );
  } else
    return null;
}
