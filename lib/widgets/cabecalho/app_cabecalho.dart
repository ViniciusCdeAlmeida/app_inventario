import 'package:GRPInventario/screens/index.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
            leading: Icon(Icons.build),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: const Text('Unidades Gestoras'),
            onTap: () {
              Navigator.of(context).pushNamed(OrganizacaoTela.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
              // Navigator.of(context).pushReplacementNamed('/');
              // Provider.of<Autenticacao>(context, listen: false).sair();
            },
          ),
        ],
      ),
    );
  }
}
