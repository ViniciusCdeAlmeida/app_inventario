import 'package:flutter/material.dart';
import 'package:GRPInventario/custom/index.dart';
import 'package:GRPInventario/models/serialized/index.dart';

// ignore: must_be_immutable
class BensInventariadosItem extends StatefulWidget {
  InventarioBemPatrimonial bemInventariado;

  BensInventariadosItem({@required this.bemInventariado});

  @override
  _BensInventariadosItemState createState() => _BensInventariadosItemState();
}

class _BensInventariadosItemState extends State<BensInventariadosItem> {
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
                  BensPrevistos('Número Patrimonial: ',
                      widget.bemInventariado.numeroPatrimonial),
                  BensPrevistos('Descrição do material: ',
                      widget.bemInventariado.material.codigoEDescricao),
                  BensPrevistos('Situação fisica: ',
                      widget.bemInventariado.dominioSituacaoFisica.descricao),
                  BensPrevistos('Status do bem: ',
                      widget.bemInventariado.dominioStatus.descricao),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        widget.bemInventariado.enviado
                            ? Icons.cloud_done
                            : Icons.cloud_off,
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
