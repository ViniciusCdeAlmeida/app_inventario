///{@category Helpers}

import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de [BensPatrimoniaisDBData] em um objeto [BemPatrimonial].
BemPatrimonial helperBemPatrimonial(BensPatrimoniaisDBData bemPatrimonial) {
  if (bemPatrimonial != null) {
    return BemPatrimonial(
      id: bemPatrimonial.id,
      caracteristicas: bemPatrimonial.caracteristicas,
      dadosBensPatrimoniais: bemPatrimonial.dadosBensPatrimoniais,
      dominioSituacaoFisica: bemPatrimonial.dominioSituacaoFisica,
      dominioStatus: bemPatrimonial.dominioStatus,
      estruturaOrganizacionalAtual: bemPatrimonial.estruturaOrganizacionalAtual,
      material: bemPatrimonial.material,
      numeroPatrimonial: bemPatrimonial.numeroPatrimonial,
      numeroPatrimonialCompleto: bemPatrimonial.numeroPatrimonialCompleto,
      numeroPatrimonialCompletoAntigo:
          bemPatrimonial.numeroPatrimonialCompletoAntigo,
      inventariado: bemPatrimonial.inventariado,
    );
  } else
    return null;
}

/// Converte o resultado de uma lista de [BensPatrimoniaisDBData] em uma lista [BemPatrimonial].
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
