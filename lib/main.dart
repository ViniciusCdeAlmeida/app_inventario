import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/providers/unidade.dart';
import 'package:app_inventario/screens/inventario/inventario_geral_tela.dart';
import 'package:app_inventario/screens/inventario/inventario_selecao_tela.dart';
import 'package:app_inventario/screens/inventario/levantamento_fisico_tela.dart';
import 'package:app_inventario/screens/unidade/unidade_tela.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/configuracao_conexao.dart';
import 'screens/configuracao/configuracao_conexao_edicao_tela.dart';
import 'screens/login/login_tela.dart';
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
        ChangeNotifierProvider(
          create: (ctx) => Unidades(),
        ),
        ChangeNotifierProxyProvider<Autenticacao, Levantamentos>(
          create: (context) => Levantamentos(),
          update: (ctx, autenticacao, previousData) => Levantamentos(
            levantamentos:
                previousData == null ? [] : previousData.levantamentos,
            idOrganizacao: autenticacao.idUnidade,
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
          home:
              autenticacaoDados.existeUsuario ? OrganizacaoTela() : LoginTela(),
          routes: {
            ConfiguracaoConexaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoTela(),
            ConfiguracaoConexaoEdicaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoEdicaoTela(),
            LoginTela.routeName: (ctx) => LoginTela(),
            OrganizacaoTela.routeName: (ctx) => OrganizacaoTela(),
            InventarioSelecaoTela.routeName: (ctx) => InventarioSelecaoTela(),
            InventarioGeralTela.routeName: (ctx) => InventarioGeralTela(),
            UnidadeTela.routeName: (ctx) => UnidadeTela(),
            LevantamentoFisicoTela.routeName: (ctx) => LevantamentoFisicoTela(),
            // LevantamentoItemTela.routeName: (ctx) => LevantamentoItemTela(),
          },
        ),
      ),
    );
  }
}
