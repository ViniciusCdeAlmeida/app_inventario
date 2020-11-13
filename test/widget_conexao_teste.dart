// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:app_inventario/models/serialized/conexao.dart';
// // import 'package:app_inventario/providers/autenticacao.dart';
// import 'package:app_inventario/providers/configuracao_conexao.dart';
// import 'package:app_inventario/screens/configuracao/configuracao_conexao_edicao_tela.dart';
// import 'package:app_inventario/screens/configuracao/configuracao_conexao_tela.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('Adição url: https://citgrp-homolog.centralit.com.br/',
//       (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     final conexoesDados = new ConfiguracaoConexao();
//     List<Conexao> testeConexoes = [
//       Conexao(
//           url: 'https://citgrp-homolog.centralit.com.br/',
//           nome: 'url 1',
//           ativo: false,
//           id: '1'),
//       Conexao(
//           url: 'https://https://192.168.15.8:8443/',
//           nome: 'url 2',
//           ativo: true,
//           id: '2')
//     ];
//     for (var i = 0; i < testeConexoes.length; i++) {
//       conexoesDados.adicionarConexao(testeConexoes[i]);
//     }
//     await tester.pumpWidget(
//       ChangeNotifierProvider<ConfiguracaoConexao>(
//         create: (ctx) => ConfiguracaoConexao(),
//         child: MaterialApp(
//           routes: {
//             ConfiguracaoConexaoTela.routeName: (ctx) =>
//                 ConfiguracaoConexaoTela(),
//             ConfiguracaoConexaoEdicaoTela.routeName: (ctx) =>
//                 ConfiguracaoConexaoEdicaoTela()
//           },
//           home: ConfiguracaoConexaoEdicaoTela(),
//         ),
//       ),
//     );

//     // expect(taps, findsOneWidget);
//     // expect(pmp, 'matcher');

//     // await tester.enterText(
//     //     find.byKey(Key('urlText')), 'https://citgrp-homolog.centralit.com.br/');
//     // await tester.enterText(find.byKey(Key('nomeText')), 'url1');
//     // await tester.press(find.byIcon(Icons.save));
//     // await tester.enterText(find.byKey(Key('switchText')), 'true');
//     // await tester.tap(find.byType(Switch));
//     await tester.pump();
//   });
// }
