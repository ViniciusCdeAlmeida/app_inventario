import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:app_inventario/widgets/alerta_conexao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/configuracao_conexao_edicao_tela.dart';
// import './alerta_conexao.dart';

class ConfiguracaoConexaoItem extends StatefulWidget {
  final String id;
  final String nome;
  final String url;
  final bool ativo;

  ConfiguracaoConexaoItem({
    @required this.id,
    @required this.url,
    @required this.nome,
    this.ativo,
  });

  @override
  _ConfiguracaoConexaoItemState createState() =>
      _ConfiguracaoConexaoItemState();
}

class _ConfiguracaoConexaoItemState extends State<ConfiguracaoConexaoItem> {
  @override
  Widget build(BuildContext context) {
    // final devideSize = MediaQuery.of(context).size;
    final conexaoAtiva =
        Provider.of<ConfiguracaoConexao>(context, listen: false)
            .atualizarConexaoAtiva(widget.id);
    return ListTile(
      title: Text(widget.nome),
      subtitle: Text(
        widget.url,
        style: TextStyle(color: Colors.black),
      ),
      leading: Container(
        child: IconButton(
          alignment: Alignment.centerLeft,
          icon: Icon(
            Icons.check_circle,
            color: widget.ativo != false
                ? Theme.of(context).toggleableActiveColor
                : null,
          ),
          onPressed: () =>
              Provider.of<ConfiguracaoConexao>(context, listen: false)
                      .verificaConexaoAtiva()
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertaConexao();
                      },
                    )
                  : {conexaoAtiva},
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    ConfiguracaoConexaoEdicaoTela.routeName,
                    arguments: widget.id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ConfiguracaoConexao>(context, listen: false)
                    .deletarConexao(widget.id);
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
