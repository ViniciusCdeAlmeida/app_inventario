import 'package:app_inventario/providers/inicializacao.dart';
import 'package:app_inventario/stores/bemPatrimonial_store.dart';
import 'package:app_inventario/stores/bensInventariados_store.dart';
import 'package:app_inventario/stores/bensPrevistos_store.dart';
import 'package:app_inventario/stores/estruturaLevantamento_store.dart';
import 'package:app_inventario/stores/inicializacao_store.dart';
import 'package:app_inventario/stores/levantamento_store.dart';
import 'package:app_inventario/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inventario.dart';

import 'package:app_inventario/screens/login/login_tela.dart';
import 'package:app_inventario/screens/organizacao/organizacao_tela.dart';

import 'package:app_inventario/custom/custom_route.dart';

AppDatabase db;

void main() {
  db = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          create: (ctx) => BensProvider(),
        ),
        Provider(
          create: (ctx) => Inicializacao(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => InventarioBensPatrimoniais(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EstruturaLevantamento(),
        ),
        ChangeNotifierProxyProvider<Autenticacao, Levantamentos>(
          create: (context) => Levantamentos(),
          update: (ctx, autenticacao, _) => Levantamentos(
            idOrganizacao: autenticacao.idUnidade,
          ),
        ),
        Provider(
          create: (ctx) => InicializacaoStore(
            Inicializacao(),
            Autenticacao(),
          ),
        ),
        Provider(
          create: (ctx) => LevantamentoStore(
            Levantamentos(),
            EstruturaLevantamento(),
          ),
        ),
        Provider(
          create: (ctx) => EstruturaLevantamentoStore(
            EstruturaLevantamento(),
          ),
        ),
        Provider(
          create: (ctx) => BensPrevistosStore(
            BensProvider(),
          ),
        ),
        Provider(
          create: (ctx) => BensInventariadoStore(
            InventarioBensPatrimoniais(),
          ),
        ),
        Provider(
          create: (ctx) => LoginStore(
            Autenticacao(),
            ConfiguracaoConexao(),
          ),
        ),
        Provider(
          create: (ctx) => BemPatrimonialStore(
            BensProvider(),
            EstruturaLevantamento(),
            Inicializacao(),
            InventarioBensPatrimoniais(),
          ),
        ),
      ],
      child: Consumer<Autenticacao>(
        builder: (ctx, autenticacaoDados, _) => MaterialApp(
          title: 'APP inventario',
          theme: ThemeData(
            primaryColor: Colors.yellow[800],
            toggleableActiveColor: const Color(0xFF2247C7),
            errorColor: const Color(0xFF7A1C02),
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
                TargetPlatform.iOS: CustomPageTransitionBuilder(),
              },
            ),
          ),
          initialRoute: '/',
          home: LoginTela(),
          routes: rotas(),
        ),
      ),
    );
  }
}
