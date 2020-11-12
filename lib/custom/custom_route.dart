import 'package:app_inventario/screens/bens/bens_inventariados_tela.dart';
import 'package:app_inventario/screens/bens/ler_bens_geral_tela.dart';
import 'package:app_inventario/screens/bens/previstos_bens_tela.dart';
import 'package:app_inventario/screens/configuracao/configuracao_conexao_edicao_tela.dart';
import 'package:app_inventario/screens/configuracao/configuracao_conexao_tela.dart';
import 'package:app_inventario/screens/inventario/inventario_geral_tela.dart';
import 'package:app_inventario/screens/inventario/inventario_selecao_tela.dart';
import 'package:app_inventario/screens/inventario/levantamento_fisico_tela.dart';
import 'package:app_inventario/screens/login/inicializacao_tela.dart';
import 'package:app_inventario/screens/login/login_tela.dart';
import 'package:app_inventario/screens/organizacao/organizacao_tela.dart';
import 'package:app_inventario/screens/unidade/unidade_tela.dart';
import 'package:app_inventario/widgets/bens/ler_bens_item.dart';
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
  var rotas = {
    ConfiguracaoConexaoTela.routeName: (ctx) => ConfiguracaoConexaoTela(),
    ConfiguracaoConexaoEdicaoTela.routeName: (ctx) =>
        ConfiguracaoConexaoEdicaoTela(),
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
  return rotas;
}
