import 'package:flutter/material.dart';

class PopupMenuCustom extends StatelessWidget {
  final String texto;
  final IconData icone;

  PopupMenuCustom(this.texto, this.icone);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icone,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(texto),
          ),
        ],
      ),
    );
  }
}
