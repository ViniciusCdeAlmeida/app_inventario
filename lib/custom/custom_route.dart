import 'package:app_inventario/screens/index.dart';
import 'package:app_inventario/widgets/index.dart';
import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

Map<String, Widget Function(BuildContext)> rotas() {
  return {
    ConexaoTela.routeName: (ctx) => ConexaoTela(),
    ConexaoEdicaoTela.routeName: (ctx) => ConexaoEdicaoTela(),
    LoginTela.routeName: (ctx) => LoginTela(),
    OrganizacaoTela.routeName: (ctx) => OrganizacaoTela(),
    InventarioSelecaoTela.routeName: (ctx) => InventarioSelecaoTela(),
    InventarioGeralTela.routeName: (ctx) => InventarioGeralTela(),
    UnidadeTela.routeName: (ctx) => UnidadeTela(),
    LevantamentoFisicoTela.routeName: (ctx) => LevantamentoFisicoTela(),
    LerBensItens.routeName: (ctx) => LerBensItens(),
    PrevistosBensTela.routeName: (ctx) => PrevistosBensTela(),
    LerBensGeralTela.routeName: (ctx) => LerBensGeralTela(),
    BensInventariadosTela.routeName: (ctx) => BensInventariadosTela(),
    InicializacaoTela.routeName: (ctx) => InicializacaoTela(),
  };
}
