import 'package:app_inventario/models/database/databaseMoor.dart';
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
            inventariado: item.inventarioBemPatrimonial != null ? true : false),
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
        idEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        numeroPatrimonialCompleto:
            dadosBemPatrimonial.numeroPatrimonialCompleto,
        inventariado: dadosBemPatrimonial.inventarioBemPatrimonial == null
            ? false
            : true);
  } else
    return null;
}

DadosBensPatrimoniais helperDadoBemPatrimonial2(
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
        idEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        numeroPatrimonialCompleto:
            dadosBemPatrimonial.numeroPatrimonialCompleto,
        bemPatrimonial: dadosBemPatrimonial.bemPatrimonial,
        inventariado: dadosBemPatrimonial.inventarioBemPatrimonial == null
            ? false
            : true);
  } else
    return null;
}
