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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BensPrevistos('Número Patrimonial: ',
                      bensLista.bemPatrimonial.numeroPatrimonialCompleto),
                  BensPrevistos(
                      'Descrição do material: ',
                      bensLista.material != null
                          ? bensLista.material.descricao
                          : null),
                  BensPrevistos(
                      'Situação: ',
                      bensLista.dominioSituacaoFisica != null
                          ? bensLista.dominioSituacaoFisica.descricao
                          : null),
                  BensPrevistos(
                      'Status: ',
                      bensLista.dominioStatus != null
                          ? bensLista.dominioStatus.descricao
                          : null),
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
