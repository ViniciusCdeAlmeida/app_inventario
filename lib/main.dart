import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/configuracao_conexao.dart';
import 'screens/configuracao_conexao_edicao_tela.dart';
import 'screens/login_tela.dart';
import 'providers/autenticacao.dart';
import 'screens/configuracao_conexao_tela.dart';

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
      ],
      child: Consumer<Autenticacao>(
        builder: (ctx, _, __) => MaterialApp(
          title: 'APP inventario',
          theme: ThemeData(
            primaryColor: const Color(0xFF72C70E),
            toggleableActiveColor: Color(0xFF2247C7),
            errorColor: Color(0xFF7A1C02),
          ),
          home: LoginTela(),
          routes: {
            ConfiguracaoConexaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoTela(),
            ConfiguracaoConexaoEdicaoTela.routeName: (ctx) =>
                ConfiguracaoConexaoEdicaoTela(),
            LoginTela.routeName: (ctx) => LoginTela(),
          },
        ),
      ),
    );
  }
}
