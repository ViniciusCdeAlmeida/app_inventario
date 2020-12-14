import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/providers/index_providers.dart';
import 'package:GRPInventario/screens/index_screens.dart';
import 'package:GRPInventario/utils/providers_utils.dart';
import 'package:GRPInventario/utils/route_utils.dart';

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
      child: Consumer<AutenticacaoProvider>(
        builder: (ctx, autenticacaoDados, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
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
          home: LoginScreen(),
          routes: rotas(),
        ),
      ),
    );
  }
}
