import 'package:flutter/material.dart';

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
        // Provider.of<Configuracao>(context, listen: false)
        //     .ativarConexao(widget.id);
        Navigator.of(context).pop();
      },
    );

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
