import 'package:app_inventario/customizacoes/bensPrevistos.dart';
import 'package:app_inventario/models/bens.dart';
import 'package:flutter/material.dart';

class PrevistosBensItem extends StatelessWidget {
  final Bens bensLista;

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
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: BensPrevistos(
                        'Número Patrimonial: ', bensLista.numeroPatrimonial),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: BensPrevistos(
                        'Descrição: ', bensLista.descricaoMaterial),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: BensPrevistos(
                        'Situação: ', bensLista.descricaoDominioSituacaoFisica),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: BensPrevistos(
                        'Status: ', bensLista.descricaoDominioStatus),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   contentPadding: EdgeInsets.only(top: -20),
            //   subtitle: Text('data'),
            //   title: Text(
            //     bensLista.descricaoMaterial,
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     bensLista.numeroPatrimonial,
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

// return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(10),
//       child: Row(
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: Text(
//                   bensLista.numeroPatrimonial,
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//               Text(
//                 bensLista.descricaoMaterial,
//                 style: TextStyle(fontSize: 14),
//               ),

//  Container(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(widget
//                           .levantamento.dominioStatusInventario.descricao),
//                       Text('Data de Inicio: ${widget.levantamento.dataInicio}'),
//                       Text(
//                           'Qtde. estruturas: ${widget.levantamento.quantidadeEstruturas}'),
//                       Text(
//                           'Qtde. bens: ${widget.levantamento.quantidadeTotalBens}'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
