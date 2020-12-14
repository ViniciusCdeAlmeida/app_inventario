import 'package:flutter/material.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/screens/index_screens.dart';

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
                    InventarioSelecaoScreen.routeName,
                    arguments: ScreenArgumentos(
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
