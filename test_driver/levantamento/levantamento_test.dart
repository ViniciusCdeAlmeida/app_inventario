import 'dart:io';
import 'package:GRPInventario/utils/keys_utils.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  levantamentoTest();
}

Future<void> levantamentoTest() async {
  FlutterDriver driver;

  final menuConexao = find.byValueKey(Keys.menuConexao);
  final homeDrawer = find.byValueKey(Keys.homeDrawer);
  final loginOfflineButton = find.byValueKey(Keys.loginOfflineButton);
  final submitLoginButton = find.byValueKey(Keys.submitLoginButton);
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      await driver.requestData('cleanDatabase');
      driver.close();
    }
  });
  group('Levantamento ->', () {
    test('Lista de levantamentos', () async {
      await driver.tap(menuConexao);
      await driver.tap(homeDrawer);
      await driver.tap(loginOfflineButton);
      await driver.tap(submitLoginButton);
      await driver.tap(find.byValueKey('organizacao_1'));
      await driver.tap(find.byValueKey('inventarioTipo_2'));
    });

    test('Detalhes do levantamento', () async {
      await driver.tap(find.byValueKey('expandCardButton_75'));
    });

    test('Estruturas de um levantamento', () async {
      await driver.tap(find.byValueKey('levantamento_estruturas_75'));
    });

    test('Bens previstos de uma estrutura', () async {
      await driver.tap(find.byValueKey('unidade_levatamento_1444'));
      await driver.tap(find.byValueKey('bens_previstos_1444'));
      await driver.tap(find.pageBack());
      await driver.tap(find.byValueKey('unidade_levatamento_1445'));
      await driver.tap(find.byValueKey('bens_previstos_1445'));
      await driver.tap(find.pageBack());
      await driver.tap(find.byValueKey('unidade_levatamento_1446'));
      await driver.tap(find.byValueKey('bens_previstos_1446'));
      sleep(Duration(seconds: 10));
    });
  });
}
