import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/screens/inventario/inventario_selecao_tela.dart';
import 'package:flutter/material.dart';

class OrganizacaoItem extends StatefulWidget {
  final int id;
  final String codigoEnome;

  OrganizacaoItem(
    this.id,
    this.codigoEnome,
  );
  @override
  _OrganizacaoItemState createState() => _OrganizacaoItemState();
}

class _OrganizacaoItemState extends State<OrganizacaoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: ListTile(
        title: Text(
          widget.codigoEnome,
        ),
        trailing: Container(
          width: 60,
          alignment: Alignment.centerRight,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    InventarioSelecaoTela.routeName,
                    arguments: TelaArgumentos(
                      id: widget.id,
                      arg1: widget.codigoEnome,
                    ),
                  );
                },
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
