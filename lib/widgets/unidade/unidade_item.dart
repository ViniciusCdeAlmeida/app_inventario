import 'package:app_inventario/models/organizacao.dart';
import 'package:flutter/material.dart';

class UnidadeItem extends StatefulWidget {
  final Organizacao unidade;

  UnidadeItem(this.unidade);

  @override
  _UnidadeItemState createState() => _UnidadeItemState();
}

class _UnidadeItemState extends State<UnidadeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.unidade.codigoENome),
          ),
        ],
      ),
    );
  }
}
