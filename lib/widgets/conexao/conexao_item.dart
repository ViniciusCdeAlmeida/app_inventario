import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/screens/index.dart';
import 'package:app_inventario/stores/index.dart';

class ConexaoItem extends StatefulWidget {
  final int id;
  final String nome;
  final String url;
  final bool ativo;

  ConexaoItem({
    @required this.id,
    @required this.url,
    @required this.nome,
    this.ativo,
  });

  @override
  _ConexaoItemState createState() => _ConexaoItemState();
}

class _ConexaoItemState extends State<ConexaoItem> {
  ConexaoStore _conexaoStore;

  @override
  void didChangeDependencies() {
    _conexaoStore = Provider.of<ConexaoStore>(context, listen: false);
    super.didChangeDependencies();
  }

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
            onPressed: () {}
            // => widget.ativo == false
            //     ? Provider.of<Configuracao>(context, listen: false)
            //             .verificaConexaoAtiva()
            //         ? showDialog(
            //             context: context,
            //             builder: (context) {
            //               return AlertaConexao(id: widget.id.toString());
            //             },
            //           )
            //         : {
            //             Provider.of<Configuracao>(context, listen: false)
            //                 .atualizarConexaoAtiva(widget.id)
            //           }
            //     : null,
            ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(ConexaoEdicaoTela.routeName,
                    arguments: widget.id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _conexaoStore.deletaConexao(widget.id);
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
