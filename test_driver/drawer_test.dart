import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Drawer', () {
    FlutterDriver driver;

    final drawerMenu = find.byValueKey('menuDrawer');
    final drawerHome = find.byValueKey('homeDrawer');
    final drawerConexao = find.byValueKey('conexaoDrawer');
    final drawerLeitura = find.byValueKey('novaLetraDrawer');
    final drawerLeituraForm = find.byValueKey('novaLetraForm');
    final drawerLeituraButton = find.byValueKey('novaLetraButton');
    final drawerDigitos = find.byValueKey('digitosDrawer');
    final drawerDigitosForm = find.byValueKey('digitosForm');
    final drawerDigitosButton = find.byValueKey('digitosButton');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Teste menu', () async {
      await driver.tap(drawerMenu);
      print('clicked on menu drawer');
    });
    test('Teste menu - home', () async {
      await driver.tap(drawerHome);
      print('clicked on menu - home drawer');
    });
    test('Teste menu - digitos', () async {
      await driver.tap(drawerMenu);
      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      await driver.enterText('8888888');
      await driver.waitFor(find.text('8888888'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      print('clicked on menu - numero drawer');
    });
    test('Teste menu - prefixo', () async {
      await driver.tap(drawerLeitura);
      await driver.tap(drawerLeituraForm);
      await driver.enterText('FF');
      await driver.waitFor(find.text('FF'));
      await driver.waitFor(drawerLeituraButton);
      await driver.tap(drawerLeituraButton);
      print('clicked on menu - leitura drawer');
    });
    test('Teste menu - conexao', () async {
      await driver.tap(drawerConexao);
      print('clicked on menu - conexao drawer');
    });
  });
}
