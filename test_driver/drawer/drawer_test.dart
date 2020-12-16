import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  drawerTest();
}

Future<void> drawerTest() async {
  group('Drawer', () {
    FlutterDriver driver;

    final drawerMenu = find.byValueKey('menuDrawer');
    final drawerHome = find.byValueKey('homeDrawer');
    // final drawerConexao = find.byValueKey('conexaoDrawer');
    final drawerPrefixo = find.byValueKey('prefixoDrawer');
    final drawerPrefixoForm = find.byValueKey('prefixoForm');
    final drawerPrefixoButton = find.byValueKey('prefixoButton');
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
    test('Teste menu - prefixo', () async {
      await driver.tap(drawerMenu);
      await driver.tap(drawerPrefixo);
      await driver.tap(drawerPrefixoForm);
      await driver.enterText('FF');
      await driver.waitFor(find.text('FF'));
      await driver.waitFor(drawerPrefixoButton);
      await driver.tap(drawerPrefixoButton);
      print('clicked and saved value on menu - leitura drawer');

      await driver.tap(drawerPrefixo);
      await driver.tap(drawerPrefixoForm);
      await driver.enterText('FF');
      await driver.waitFor(find.text('FF'));
      await driver.waitFor(drawerPrefixoButton);
      await driver.tap(drawerPrefixoButton);
      print('restored value on menu - leitura drawer');
    });
    test('Teste menu - digitos', () async {
      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      await driver.enterText('8888888');
      await driver.waitFor(find.text('8888888'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      print('clicked and saved value on menu - digitos drawer');

      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      await driver.waitFor(find.text('8888888'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      print('restored value on menu - digitos drawer');

      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      await driver.enterText('f');
      await driver.waitFor(find.text('f'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      expect(await driver.getText(find.text('Permitido somente números.')),
          'Permitido somente números.');
      print('insert numeric on menu - digitos drawer');

      await driver.enterText('33');
      await driver.waitFor(find.text('33'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      expect(
          await driver
              .getText(find.text('Valor inserido não está entre 6 e 15.')),
          'Valor inserido não está entre 6 e 15.');
      print('insert wrong length on menu - digitos drawer');

      await driver.enterText('222222');
      await driver.waitFor(find.text('222222'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      print('new value on menu - digitos drawer');
    });
  });
}
