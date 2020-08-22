import 'package:app_inventario/customizacoes/bensPrevistos.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/screens/bens/ler_bens_geral_tela.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrevistosBensItem extends StatefulWidget {
  DadosBensPatrimoniais bemInventario;

  PrevistosBensItem({@required this.bemInventario});

  @override
  _PrevistosBensItemState createState() => _PrevistosBensItemState();
}

class _PrevistosBensItemState extends State<PrevistosBensItem> {
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
                      widget.bemInventario.bemPatrimonial != null &&
                              widget.bemInventario.bemPatrimonial
                                      .numeroPatrimonial !=
                                  null
                          ? widget
                              .bemInventario.bemPatrimonial.numeroPatrimonial
                          : widget.bemInventario.inventarioBemPatrimonial
                              .numeroPatrimonial),
                  BensPrevistos('Descrição do material: ',
                      widget.bemInventario.material.codigoEDescricao),
                  BensPrevistos(
                      'Situação fisica: ',
                      widget.bemInventario.dominioSituacaoFisica != null
                          ? widget.bemInventario.dominioSituacaoFisica.descricao
                          : widget.bemInventario.inventarioBemPatrimonial
                                      .dominioSituacaoFisica !=
                                  null
                              ? widget.bemInventario.inventarioBemPatrimonial
                                  .dominioSituacaoFisica.descricao
                              : 'Não contem'),
                  BensPrevistos(
                      'Status do bem: ',
                      widget.bemInventario.dominioStatus != null
                          ? widget.bemInventario.dominioStatus.descricao
                          : widget.bemInventario.inventarioBemPatrimonial
                                      .dominioStatus !=
                                  null
                              ? widget.bemInventario.inventarioBemPatrimonial
                                  .dominioStatus.descricao
                              : 'Não contem'),
                  BensPrevistos(
                      'Status no Inventario: ',
                      widget.bemInventario.dominioStatusInventarioBem != null
                          ? widget.bemInventario.dominioStatusInventarioBem
                              .descricao
                          : null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: !widget.bemInventario.inventariado
                            ? Icon(Icons.content_paste)
                            : Icon(Icons.check),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            LerBensGeralTela.routeName,
                            arguments: widget
                                .bemInventario.bemPatrimonial.numeroPatrimonial,
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
