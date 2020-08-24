import 'package:app_inventario/helpers/helper_caracteristicasEst.dart';
import 'package:app_inventario/helpers/helper_estruturaOrganizacional.dart';
import 'package:app_inventario/helpers/helper_materialEst.dart';
import 'package:app_inventario/helpers/helpers_organizacao.dart';
import 'package:app_inventario/models/bemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';

import 'helper_dominio.dart';

BemPatrimonial helperBemPatrimonialEst(
    dynamic listaBemPatrimonial, List<Dominio> listaDominios) {
  if (listaBemPatrimonial != null) {
    return BemPatrimonial(
      id: listaBemPatrimonial['id'],
      numeroPatrimonial: listaBemPatrimonial['numeroPatrimonial'],
      numeroPatrimonialCompleto:
          listaBemPatrimonial['numeroPatrimonialCompleto'],
      material: helperMaterial(listaBemPatrimonial['material']),
      caracteristicas: (listaBemPatrimonial['caracteristicas'] as List<dynamic>)
          .map(
            (dadosCaractetisticas) =>
                helperCaracteristicas(dadosCaractetisticas, listaDominios),
          )
          .toList(),
    );
  } else
    return null;
}

List<BemPatrimonialDemanda> helperBemPatrimonialDemanda(
    List listaBemPatrimonial, List<Dominio> listaDominios) {
  if (listaBemPatrimonial != null) {
    return List<BemPatrimonialDemanda>.from(
      (listaBemPatrimonial).map(
        (item) => BemPatrimonialDemanda(
          id: item['id'],
          numeroPatrimonial: item['numeroPatrimonial'],
          numeroPatrimonialCompleto: item['numeroPatrimonialCompleto'],
          numeroPatrimonialCompletoAntigo:
              item['numeroPatrimonialCompletoAntigo'],
          materialBem: helperMaterial(item['material']),
          dominioSituacaoFisica: helperDominio(item['dominioSituacaoFisica']),
          dominioStatus: helperDominio(item['dominioStatus']),
          estruturaOrganizacionalAtual: helperEstruturaOrganizacional(
              item['estruturaOrganizacionalAtual']),
          caracteristicas: (item['caracteristicas'] as List<dynamic>)
              .map(
                (dadosCaractetisticas) =>
                    helperCaracteristicas(dadosCaractetisticas, listaDominios),
              )
              .toList(),
        ),
      ),
    );
  } else
    return null;
}
