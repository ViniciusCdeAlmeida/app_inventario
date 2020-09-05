import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';

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

BemPatrimonial helperDadoBemPatrimonial2(
    BensPatrimoniaisDBData bemPatrimonial) {
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
