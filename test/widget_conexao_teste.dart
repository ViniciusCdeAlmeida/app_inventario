// import 'package:GRPInventario/models/index_models.dart';
// import 'package:GRPInventario/providers/autenticacao.dart';
// import 'package:GRPInventario/providers/index_providers.dart';
// import 'package:GRPInventario/screens/index_screens.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Adição url: https://citgrp-homolog.centralit.com.br/',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // final conexoesDados = new ConfiguracaoConexao();
    // List<Conexao> testeConexoes = [
    //   Conexao(
    //       url: 'https://citgrp-homolog.centralit.com.br/',
    //       nome: 'url 1',
    //       ativo: false,
    //       id: 1),
    //   Conexao(
    //       url: 'https://https://192.168.15.8:8443/',
    //       nome: 'url 2',
    //       ativo: true,
    //       id: 2)
    // ];
    // for (var i = 0; i < testeConexoes.length; i++) {
    //   conexoesDados.adicionarConexao(testeConexoes[i]);
    // }
    // await tester.pumpWidget(
    //   ChangeNotifierProvider<ConfiguracaoConexao>(
    //     create: (ctx) => ConfiguracaoConexao(),
    //     child: MaterialApp(
    //       routes: {
    //         ConfiguracaoConexaoScreen.routeName: (ctx) =>
    //             ConfiguracaoConexaoScreen(),
    //         ConfiguracaoConexaoEdicaoScreen.routeName: (ctx) =>
    //             ConfiguracaoConexaoEdicaoScreen()
    //       },
    //       home: ConfiguracaoConexaoEdicaoScreen(),
    //     ),
    //   ),
    // );

    // expect(taps, findsOneWidget);
    // expect(pmp, 'matcher');

    await tester.enterText(
        find.byKey(Key('urlText')), 'https://citgrp-homolog.centralit.com.br/');
    await tester.enterText(find.byKey(Key('nomeText')), 'url1');
    await tester.press(find.byIcon(Icons.save));
    await tester.enterText(find.byKey(Key('switchText')), 'true');
    await tester.tap(find.byType(Switch));
    await tester.pump();
  });
}
