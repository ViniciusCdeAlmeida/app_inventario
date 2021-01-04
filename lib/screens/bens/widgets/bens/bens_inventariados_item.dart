import 'package:GRPInventario/screens/bens/widgets/bens/bens_previstos_item.dart';
import 'package:flutter/material.dart';
import 'package:GRPInventario/models/index_models.dart';

class BensInventariadosItem extends StatefulWidget {
  final InventarioBemPatrimonial bemInventariado;

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
                  BensPrevistosItem('Número Patrimonial: ',
                      widget.bemInventariado.numeroPatrimonial),
                  BensPrevistosItem('Descrição do material: ',
                      widget.bemInventariado.material.codigoEDescricao),
                  BensPrevistosItem('Situação fisica: ',
                      widget.bemInventariado.dominioSituacaoFisica.descricao),
                  BensPrevistosItem('Status do bem: ',
                      widget.bemInventariado.dominioStatus.descricao),
                  // BensPrevistosItem(
                  //     'UL Coletada: ', widget.bemInventariado..descricao), 020604,021212
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
