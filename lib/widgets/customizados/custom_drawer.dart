import 'package:app_inventario/screens/configuracao/configuracao_bens_tela.dart';
import 'package:app_inventario/screens/configuracao/configuracao_conexao_tela.dart';
import 'package:app_inventario/screens/configuracao/configuracao_numero_tela.dart';
import 'package:flutter/material.dart';

import 'pagina_principal.dart';

class MyDrawer extends StatelessWidget {
  void _configBens(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ConfiguracaoBensTela(),
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
          child: ConfiguracaoNumeroTela(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).toggleableActiveColor,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
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
                  Navigator.of(context).pushNamed(PaginaPrincipal.routeName);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phonelink_setup),
                title: const Text('Conexão'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ConfiguracaoConexaoTela.routeName);
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
        ),
      ),
    );
  }
}
