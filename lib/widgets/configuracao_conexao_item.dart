import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/configuracao_conexao_edicao_tela.dart';

class ConfiguracaoConexaoItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: ativo == false ? Colors.black : Colors.deepPurple[400],
      child: ListTile(
        title: Text(nome),
        subtitle: Text(url),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      ConfiguracaoConexaoEdicaoTela.routeName,
                      arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<ConfiguracaoConexao>(context, listen: false)
                      .deletarConexao(id);
                },
                color: Theme.of(context).errorColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
