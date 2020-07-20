import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/screens/inventario/inventarioGeral/inventario_geral_tela.dart';
import 'package:app_inventario/screens/inventario/inventarioGeral/inventario_item_tela.dart';
import 'package:app_inventario/screens/inventario/inventario_selecao_tela.dart';
import 'package:app_inventario/screens/inventario/levantamentoFisico/levantamento_fisico_tela.dart';
import 'package:app_inventario/screens/inventario/levantamentoFisico/levantamento_item_tela.dart';
import 'package:app_inventario/widgets/customizados/pagina_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/configuracao_conexao.dart';
import 'screens/configuracao/configuracao_conexao_edicao_tela.dart';
import 'providers/autenticacao.dart';
import 'screens/configuracao/configuracao_conexao_tela.dart';
import 'package:app_inventario/providers/inventario.dart';
import 'package:app_inventario/screens/organizacao/organizacao_tela.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Autenticacao(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ConfiguracaoConexao(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Inventario(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Levantamentos(),
        // ),
        ChangeNotifierProxyProvider<Autenticacao, Levantamentos>(
          update: (ctx, autenticacao, previousData) => Levantamentos(
            previousData == null ? [] : previousData.levantamentos,
            autenticacao.idUnidade,
          ),
        ),
      ],
      child: Consumer<Autenticacao>(
        builder: (ctx, autenticacaoDados, _) => MaterialApp(
          title: 'APP inventario',
          theme: ThemeData(
            primaryColor: const Color(0xFF72C70E),
            toggleableActiveColor: Color(0xFF2247C7),
            errorColor: Color(0xFF7A1C02),
          ),
          home: autenticacaoDados.existeUsuario
              ? OrganizacaoTela()
              : PaginaPrincipal(),
          routes: {
            ConfiguracaoConexaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoTela(),
            ConfiguracaoConexaoEdicaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoEdicaoTela(),
            PaginaPrincipal.routeName: (ctx) => PaginaPrincipal(),
            OrganizacaoTela.routeName: (ctx) => OrganizacaoTela(),
            InventarioSelecaoTela.routeName: (ctx) => InventarioSelecaoTela(),
            InventarioGeralTela.routeName: (ctx) => InventarioGeralTela(),
            InventarioItemTela.routeName: (ctx) => InventarioItemTela(),
            LevantamentoFisicoTela.routeName: (ctx) => LevantamentoFisicoTela(),
            LevantamentoItemTela.routeName: (ctx) => LevantamentoItemTela(),
          },
        ),
      ),
    );
  }
}
