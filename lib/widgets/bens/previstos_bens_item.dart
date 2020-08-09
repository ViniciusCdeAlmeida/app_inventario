import 'package:app_inventario/customizacoes/bensPrevistos.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/widgets/bens/ler_bens_geral_item.dart';
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
                  BensPrevistos('Descrição do material: ',
                      bensLista.material.codigoEDescricao),
                  BensPrevistos(
                      'Situação fisica: ',
                      bensLista.dominioSituacaoFisica != null
                          ? bensLista.dominioSituacaoFisica.descricao
                          : bensLista.inventarioBemPatrimonial
                                      .dominioSituacaoFisica !=
                                  null
                              ? bensLista.inventarioBemPatrimonial
                                  .dominioSituacaoFisica.descricao
                              : 'Não contem'),
                  BensPrevistos(
                      'Status do bem: ',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text('Inventariar'),
                      IconButton(
                        icon: Icon(Icons.content_paste),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            LerBensGeralTela.routeName,
                            arguments:
                                bensLista.bemPatrimonial.numeroPatrimonial,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
