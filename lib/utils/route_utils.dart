import 'package:GRPInventario/screens/bens/widgets/bens/ler_bens_item.dart';
import 'package:GRPInventario/screens/index_screens.dart';

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
    ConexaoScreen.routeName: (ctx) => ConexaoScreen(),
    ConexaoEdicaoScreen.routeName: (ctx) => ConexaoEdicaoScreen(),
    LoginScreen.routeName: (ctx) => LoginScreen(),
    OrganizacaoScreen.routeName: (ctx) => OrganizacaoScreen(),
    InventarioSelecaoScreen.routeName: (ctx) => InventarioSelecaoScreen(),
    InventarioGeralScreen.routeName: (ctx) => InventarioGeralScreen(),
    UnidadeScreen.routeName: (ctx) => UnidadeScreen(),
    LevantamentoFisicoScreen.routeName: (ctx) => LevantamentoFisicoScreen(),
    LerBensItens.routeName: (ctx) => LerBensItens(),
    PrevistosBensScreen.routeName: (ctx) => PrevistosBensScreen(),
    InventariarBensScreen.routeName: (ctx) => InventariarBensScreen(),
    BensInventariadosScreen.routeName: (ctx) => BensInventariadosScreen(),
    InicializacaoScreen.routeName: (ctx) => InicializacaoScreen(),
  };
}
