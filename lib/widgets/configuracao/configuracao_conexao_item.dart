import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:app_inventario/widgets/alerta/alerta_conexao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/configuracao/configuracao_conexao_edicao_tela.dart';

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
          onPressed: () => widget.ativo == false
              ? Provider.of<ConfiguracaoConexao>(context, listen: false)
                      .verificaConexaoAtiva()
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertaConexao(id: widget.id);
                      },
                    )
                  : {
                      Provider.of<ConfiguracaoConexao>(context, listen: false)
                          .atualizarConexaoAtiva(widget.id)
                    }
              : null,
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
