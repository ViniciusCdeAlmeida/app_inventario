import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

Mascara helperMascara(MascaraNumeroPatrimonialDBData mascara) {
  if (mascara != null) {
    return Mascara(
      id: mascara.id,
      mascara: mascara.mascara,
    );
  } else
    return null;
}
