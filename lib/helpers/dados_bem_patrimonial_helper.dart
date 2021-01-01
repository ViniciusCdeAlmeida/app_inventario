///{@category Helpers}
import 'package:GRPInventario/database/database_moor.dart';

import 'package:GRPInventario/models/index_models.dart';

/// Converte o resultado de uma lista de [DadosBemPatrimoniaisDBData] em uma lista de objetos [DadosBensPatrimoniais].
List<DadosBensPatrimoniais> helperDadosBemPatrimonialLista(
    List<DadosBemPatrimoniaisDBData> listaBemPatrimonial) {
  if (listaBemPatrimonial != null) {
    return List<DadosBensPatrimoniais>.from(
      (listaBemPatrimonial).map(
        (item) => DadosBensPatrimoniais(
          id: item.id,
          material: item.material,
          dominioSituacaoFisica: item.dominioSituacaoFisica,
          dominioStatus: item.dominioStatus,
          dominioStatusInventarioBem: item.dominioStatusInventarioBem,
          idInventario: item.idInventario,
          idInventarioEstruturaOrganizacional: item.idEstruturaOrganizacional,
          inventarioBemPatrimonial: item.inventarioBemPatrimonial,
          numeroPatrimonial: item.numeroPatrimonialCompleto,
          idBemPatrimonial: item.idBemPatrimonial,
          idEstruturaOrganizacional: item.idEstruturaOrganizacional,
          numeroPatrimonialCompleto: item.numeroPatrimonialCompleto,
          inventariado: item.inventariado,
        ),
      ),
    );
  } else
    return null;
}

/// Converte o resultado de uma lista de [InventarioBemPatrimonialDBData] que estão fora do espelho em uma lista [DadosBensPatrimoniais].
List<DadosBensPatrimoniais> helperDadosBemPatrimonialForaEspelhoLista(
    List<InventarioBemPatrimonialDBData> listaBemPatrimonial,
    int idEstruturaOrganizacional) {
  if (listaBemPatrimonial != null) {
    return List<DadosBensPatrimoniais>.from(
      (listaBemPatrimonial).map(
        (item) => DadosBensPatrimoniais(
          material: item.material,
          dominioSituacaoFisica: item.dominioSituacaoFisica,
          dominioStatus: item.dominioStatus,
          dominioStatusInventarioBem: item.dominioStatusInventarioBem,
          idInventarioEstruturaOrganizacional:
              item.idInventarioEstruturaOrganizacionalMobile,
          numeroPatrimonial: item.numeroPatrimonial,
          idBemPatrimonial: item.idDadosBemPatrimonialMobile,
          idEstruturaOrganizacional: idEstruturaOrganizacional,
          numeroPatrimonialCompleto: item.numeroPatrimonial,
          inventariado: true,
        ),
      ),
    );
  } else
    return null;
}

/// Converte o resultado de [DadosBemPatrimoniaisDBData] em um objeto [DadosBensPatrimoniais].
DadosBensPatrimoniais helperDadoBemPatrimonial(
    DadosBemPatrimoniaisDBData dadosBemPatrimonial) {
  if (dadosBemPatrimonial != null) {
    return DadosBensPatrimoniais(
      id: dadosBemPatrimonial.id,
      material: dadosBemPatrimonial.material,
      dominioSituacaoFisica: dadosBemPatrimonial.dominioSituacaoFisica,
      dominioStatus: dadosBemPatrimonial.dominioStatus,
      dominioStatusInventarioBem:
          dadosBemPatrimonial.dominioStatusInventarioBem,
      idInventario: dadosBemPatrimonial.idInventario,
      idInventarioEstruturaOrganizacional:
          dadosBemPatrimonial.idEstruturaOrganizacional,
      inventarioBemPatrimonial: dadosBemPatrimonial.inventarioBemPatrimonial,
      numeroPatrimonial: dadosBemPatrimonial.numeroPatrimonialCompleto,
      idBemPatrimonial: dadosBemPatrimonial.idBemPatrimonial,
      idEstruturaOrganizacional: dadosBemPatrimonial.idEstruturaOrganizacional,
      numeroPatrimonialCompleto: dadosBemPatrimonial.numeroPatrimonialCompleto,
      inventariado: dadosBemPatrimonial.inventariado,
    );
  } else
    return null;
}
