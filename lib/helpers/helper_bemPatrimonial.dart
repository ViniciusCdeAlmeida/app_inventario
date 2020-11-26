import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/index.dart';

BemPatrimonial helperBemPatrimonial(BensPatrimoniaisDBData bemPatrimonial) {
  if (bemPatrimonial != null) {
    return BemPatrimonial(
      id: bemPatrimonial.id,
      numeroPatrimonial: bemPatrimonial.numeroPatrimonial,
      numeroPatrimonialCompleto: bemPatrimonial.numeroPatrimonialCompleto,
      numeroPatrimonialCompletoAntigo:
          bemPatrimonial.numeroPatrimonialCompletoAntigo,
      material: bemPatrimonial.material,
      dominioSituacaoFisica: bemPatrimonial.dominioSituacaoFisica,
      dominioStatus: bemPatrimonial.dominioStatus,
      estruturaOrganizacionalAtual: bemPatrimonial.estruturaOrganizacionalAtual,
      caracteristicas: bemPatrimonial.caracteristicas,
      inventariado: bemPatrimonial.inventariado,
    );
  } else
    return null;
}

List<BemPatrimonial> helperBemPatrimonialLista(
    List<BensPatrimoniaisDBData> listaBemPatrimonial) {
  if (listaBemPatrimonial != null) {
    return List<BemPatrimonial>.from(
      (listaBemPatrimonial).map(
        (item) => BemPatrimonial(
          id: item.id,
          numeroPatrimonial: item.numeroPatrimonial,
          numeroPatrimonialCompleto: item.numeroPatrimonialCompleto,
          numeroPatrimonialCompletoAntigo: item.numeroPatrimonialCompletoAntigo,
          material: item.material,
          dominioSituacaoFisica: item.dominioSituacaoFisica,
          dominioStatus: item.dominioStatus,
          estruturaOrganizacionalAtual: item.estruturaOrganizacionalAtual,
          caracteristicas: item.caracteristicas,
          inventariado: item.inventariado,
        ),
      ),
    );
  } else
    return null;
}
