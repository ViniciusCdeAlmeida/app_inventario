import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/providers/configuracao_conexao.dart';

class AlertaConexao extends StatefulWidget {
  final String id;

  AlertaConexao({@required this.id});

  @override
  _AlertaConexaoState createState() => _AlertaConexaoState();
}

class _AlertaConexaoState extends State<AlertaConexao> {
  @override
  Widget build(BuildContext context) {
    Widget cancelarBtn = FlatButton(
      child: Text("Não"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuarBtn = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        Provider.of<ConfiguracaoConexao>(context, listen: false)
            .ativarConexao(widget.id);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Atenção"),
      content: Text("Existe conexão ativa. Deseja ativar essa conexão?"),
      actions: [
        cancelarBtn,
        continuarBtn,
      ],
    );
    return alert;
  }
}
