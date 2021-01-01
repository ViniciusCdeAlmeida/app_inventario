import 'package:GRPInventario/utils/keys_utils.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  drawerTest();
}

Future<void> drawerTest() async {
  FlutterDriver driver;

  final drawerMenu = find.byValueKey(Keys.menuDrawer);
  final drawerHome = find.byValueKey(Keys.homeDrawer);
  final drawerPrefixo = find.byValueKey(Keys.prefixoDrawer);
  final drawerPrefixoForm = find.byValueKey(Keys.prefixoForm);
  final drawerPrefixoButton = find.byValueKey(Keys.prefixoButton);
  final drawerDigitos = find.byValueKey(Keys.digitosDrawer);
  final drawerDigitosForm = find.byValueKey(Keys.digitosForm);
  final drawerDigitosButton = find.byValueKey(Keys.digitosButton);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    await driver.requestData('inicializacao');
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Drawer Prefixo ->', () {
    test('Teste menu - Abrir menu', () async {
      await driver.tap(drawerMenu);
    });

    test('Teste menu - click em Home', () async {
      await driver.tap(drawerHome);
    });

    test('Teste menu - adição - prefixo.', () async {
      await driver.tap(drawerMenu);
      await driver.tap(drawerPrefixo);
      await driver.tap(drawerPrefixoForm);
      await driver.enterText('FF');
      await driver.waitFor(find.text('FF'));
      await driver.waitFor(drawerPrefixoButton);
      expect(await driver.getText(find.text('FF')), 'FF');
      await driver.tap(drawerPrefixoButton);
    });

    test('Teste menu - edição - prefixo.', () async {
      await driver.tap(drawerPrefixo);
      await driver.tap(drawerPrefixoForm);
      await driver.enterText('FFF');
      await driver.waitFor(find.text('FFF'));
      expect(await driver.getText(find.text('FFF')), 'FFF');
      await driver.waitFor(drawerPrefixoButton);
      await driver.tap(drawerPrefixoButton);
    });
  });

  group('Drawer Digitos ->', () {
    test('Teste menu - validação não permitir letras - digitos.', () async {
      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      await driver.enterText('f');
      await driver.waitFor(find.text('f'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      expect(await driver.getText(find.text('Permitido somente números.')),
          'Permitido somente números.');
    });

    test(
        'Teste menu - validação numero maximo e minimo de caracteres - digitos.',
        () async {
      await driver.enterText('33');
      await driver.waitFor(find.text('33'));
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
      expect(
          await driver
              .getText(find.text('Valor inserido não está entre 6 e 15.')),
          'Valor inserido não está entre 6 e 15.');
    });
    test('Teste menu - adição - digitos.', () async {
      await driver.tap(drawerDigitosForm);
      await driver.enterText('8888888');
      await driver.waitFor(find.text('8888888'));
      expect(await driver.getText(find.text('8888888')), '8888888');
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
    });

    test('Teste menu - edição - digitos.', () async {
      await driver.tap(drawerDigitos);
      await driver.tap(drawerDigitosForm);
      expect(await driver.getText(find.text('8888888')), '8888888');
      await driver.enterText('222222');
      await driver.waitFor(find.text('222222'));
      expect(await driver.getText(find.text('222222')), '222222');
      await driver.waitFor(drawerDigitosButton);
      await driver.tap(drawerDigitosButton);
    });
  });
}
