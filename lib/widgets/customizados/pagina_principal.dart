import 'package:app_inventario/screens/autenticacao/autenticacao_tela.dart';
import 'package:app_inventario/widgets/customizados/custom_cabecalho.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    bool flip = false;
    AppBar appBar = flip
        ? AppBar()
        : AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => CustomCabecalho.of(context).open(),
                );
              },
            ),
            title: const Text('CITSmart - Inventário'),
          );
    Widget child = LoginTela(appbar: appBar);
    return CustomCabecalho(child: child);
  }
}
