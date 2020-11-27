import 'package:GRPInventario/screens/index.dart';
import 'package:flutter/material.dart';

class InventarioSelecaoItem extends StatelessWidget {
  final String nome;
  final int tipo;
  final int idOrganizacao;

  InventarioSelecaoItem(this.nome, this.tipo, this.idOrganizacao);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTileTheme(
          dense: false,
          child: ListTile(
            contentPadding:
                const EdgeInsets.only(top: 5.0, left: 10.0, right: 5.0),
            title: Text(nome),
            leading: Container(
              child: Icon(
                Icons.assignment,
                color: Colors.black,
              ),
            ),
            trailing: Container(
              width: 60,
              alignment: Alignment.centerRight,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      tipo == 1
                          ? Navigator.pushReplacementNamed(
                              context,
                              InventarioGeralTela.routeName,
                              arguments: idOrganizacao,
                            )
                          : Navigator.pushReplacementNamed(
                              context,
                              LevantamentoFisicoTela.routeName,
                              arguments: idOrganizacao,
                            );
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
