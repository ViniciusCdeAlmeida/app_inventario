import 'package:app_inventario/customizacoes/bensPrevistos.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:flutter/material.dart';

class PrevistosBensItem extends StatelessWidget {
  final DadosBensPatrimoniais bensLista;

  PrevistosBensItem(this.bensLista);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BensPrevistos(
                      'Número Patrimonial: ',
                      bensLista.bemPatrimonial != null &&
                              bensLista.bemPatrimonial.numeroPatrimonial != null
                          ? bensLista.bemPatrimonial.numeroPatrimonial
                          : bensLista
                              .inventarioBemPatrimonial.numeroPatrimonial),
                  BensPrevistos(
                      'Descrição do material: ',
                      bensLista.bemPatrimonial != null &&
                              bensLista.bemPatrimonial.material.descricao !=
                                  null
                          ? bensLista.bemPatrimonial.material.descricao
                          : 'Não contem'),
                  BensPrevistos(
                      'Situação: ',
                      bensLista.dominioSituacaoFisica != null
                          ? bensLista.dominioSituacaoFisica.descricao
                          : bensLista.inventarioBemPatrimonial
                                      .dominioSituacaoFisica !=
                                  null
                              ? bensLista.inventarioBemPatrimonial
                                  .dominioSituacaoFisica.descricao
                              : 'Não contem'),
                  BensPrevistos(
                      'Status: ',
                      bensLista.dominioStatus != null
                          ? bensLista.dominioStatus.descricao
                          : bensLista.inventarioBemPatrimonial.dominioStatus !=
                                  null
                              ? bensLista.inventarioBemPatrimonial.dominioStatus
                                  .descricao
                              : 'Não contem'),
                  BensPrevistos(
                      'Status no Inventario: ',
                      bensLista.dominioStatusInventarioBem != null
                          ? bensLista.dominioStatusInventarioBem.descricao
                          : null),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
