import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/screens/organizacao/organizacao_tela.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Autenticacao>(context, listen: false).sair();
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.info_outline),
          //   title: const Text('Leitura de bens'),
          //   onTap: () {
          //     _configBens(context);
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.edit),
          //   title: const Text('Número patrimoninal'),
          //   onTap: () {
          //     _configNumero(context);
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.bluetooth),
          //   title: const Text('Configuração RFID'),
          //   onTap: null,
          // ),
        ],
      ),
    );
  }
}
