import 'package:app_inventario/models/bens.dart';
import 'package:flutter/material.dart';

class PrevistosBensItem extends StatelessWidget {
  final Bens bensLista;

  PrevistosBensItem(this.bensLista);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(bensLista.numeroPatrimonial),
        ),
      ],
    );
  }
}
