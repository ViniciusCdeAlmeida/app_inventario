import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/providers/autenticacao.dart';

import 'package:app_inventario/screens/login/login_tela.dart';

import 'package:app_inventario/custom/custom_route.dart';
import 'package:app_inventario/custom/custom_providers.dart';

AppDatabase db;

void main() {
  db = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
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
