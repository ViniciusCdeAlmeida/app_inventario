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
          child: ConfiguracaoDigitosScreen(),
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
          child: ConfiguracaoPrefixoScreen(),
        );
      },
    );
  }

  @visibleForTesting
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
            leading: Icon(
              Icons.home,
              // key: ValueKey('homeDrawer'),
            ),
            title: const Text(
              'Home',
              // key: ValueKey('homeDrawer'),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
            key: ValueKey('homeDrawer'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phonelink_setup),
            title: const Text('Conexão'),
            onTap: () {
              Navigator.of(context).pushNamed(ConexaoScreen.routeName);
            },
            key: ValueKey('conexaoDrawer'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info_outline,
            ),
            title: const Text('Leitura de bens'),
            onTap: () {
              _configBens(context);
            },
            key: ValueKey('digitosDrawer'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Número patrimoninal'),
            onTap: () {
              _configNumero(context);
            },
            key: ValueKey('prefixoDrawer'),
          ),
          Divider(),
          ListTile(
            key: ValueKey('rfidDrawer'),
            leading: Icon(Icons.bluetooth),
            title: const Text('Configuração RFID'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
