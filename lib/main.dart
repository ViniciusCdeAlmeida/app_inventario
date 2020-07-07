import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_tela.dart';
import 'providers/autenticacao.dart';

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
      ],
      child: Consumer<Autenticacao>(
        builder: (ctx, _, __) => MaterialApp(
          title: 'APP inventario',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.purple,
          ),
          home: LoginTela(),
        ),
      ),
    );
  }
}
