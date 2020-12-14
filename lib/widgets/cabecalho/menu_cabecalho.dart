import 'package:flutter/material.dart';

import 'package:GRPInventario/screens/index_screens.dart';

class MenuDrawer extends StatelessWidget {
  void _configBens(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ConfiguracaoBensScreen(),
        );
      },
    );
  }

  void _configNumero(BuildContext ctx) {
    showModalBottomSheet(
      enableDrag: true,
      context: ctx,
      clipBehavior: Clip.hardEdge,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ConfiguracaoNumeroScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Configurações gerais'),
            automaticallyImplyLeading: false,
            leading: Icon(Icons.build),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phonelink_setup),
            title: const Text('Conexão'),
            onTap: () {
              Navigator.of(context).pushNamed(ConexaoScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: const Text('Leitura de bens'),
            onTap: () {
              _configBens(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Número patrimoninal'),
            onTap: () {
              _configNumero(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bluetooth),
            title: const Text('Configuração RFID'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
