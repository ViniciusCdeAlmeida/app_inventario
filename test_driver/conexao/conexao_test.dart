import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  conexaoTest();
}

Future<void> conexaoTest() async {
  group('Conexão ->', () {
    FlutterDriver driver;

    final conexao = find.byValueKey('conexaoDrawer');
    final conexaoAdicao = find.byValueKey('conexaoAdicaoButton');
    final conexaoExclusao = find.byValueKey('conexaoExclusaoButton');
    final conexaoEdicao = find.byValueKey('conexaoEdicaoButton');
    final conexaoConclusao = find.byValueKey('conexaoConclusaoButton');
    final conexaoUrlForm = find.byValueKey('conexaoAdicaoUrlForm');
    final conexaoNomeForm = find.byValueKey('conexaoAdicaoNomeForm');
    final conexaoSwitchForm = find.byValueKey('conexaoAdicaoSwitchForm');

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
    test('Teste menu - abrir tela de listagem conexão.', () async {
      await driver.tap(conexao);
      print('clicked on menu - conexao drawer');
    });
    test(
        'Teste conexão - abrir tela de adição de conexão e passando url e nome invalidas.',
        () async {
      await driver.tap(conexaoAdicao);
      await driver.tap(conexaoConclusao);
      expect(await driver.getText(find.text('Informe o Nome.')),
          'Informe o Nome.');
      expect(
          await driver.getText(find.text('Informe a URL.')), 'Informe a URL.');
    });
    test(
        'Teste conexão - abrir tela de adicao de conexão e passando url invalida.',
        () async {
      await driver.tap(conexaoNomeForm);
      await driver.enterText('Conexao teste');
      await driver.waitFor(find.text('Conexao teste'));
      expect(
          await driver.getText(find.text('Informe a URL.')), 'Informe a URL.');
    });
    test(
        'Teste conexão - abrir tela de adicao de conexão e passando nome invalido.',
        () async {
      await driver.tap(conexaoNomeForm);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.tap(conexaoUrlForm);
      await driver.enterText('https://192.168.15.2:8443');
      await driver.waitFor(find.text('https://192.168.15.2:8443'));
      expect(await driver.getText(find.text('Informe o Nome.')),
          'Informe o Nome.');
    });
    test('Teste conexão - adicao de conexão uma valida.', () async {
      await driver.tap(conexaoNomeForm);
      await driver.enterText('Teste 1');
      await driver.waitFor(find.text('Teste 1'));
      await driver.tap(conexaoUrlForm);
      await driver.enterText('');
      await driver.enterText('https://192.168.15.2:8443');
      await driver.waitFor(find.text('https://192.168.15.2:8443'));
      await driver.tap(conexaoSwitchForm);
      await driver.tap(conexaoConclusao);

      expect(await driver.getText(find.text('Teste 1')), 'Teste 1');
      expect(await driver.getText(find.text('https://192.168.15.2:8443')),
          'https://192.168.15.2:8443');
    });

    test('Teste conexão - edição valida de conexão uma valida.', () async {
      await driver.tap(conexaoEdicao);
      await driver.tap(conexaoNomeForm);
      await driver.enterText('');
      await driver.tap(conexaoConclusao);
      expect(await driver.getText(find.text('Informe o Nome.')),
          'Informe o Nome.');

      await driver.tap(conexaoNomeForm);
      await driver.enterText('Teste 2');
      await driver.waitFor(find.text('Teste 2'));
      await driver.tap(conexaoUrlForm);
      await driver.enterText('');
      await driver.tap(conexaoConclusao);
      expect(
          await driver.getText(find.text('Informe a URL.')), 'Informe a URL.');

      await driver.tap(conexaoUrlForm);
      await driver.enterText('https://192.168.15.12:8443');
      await driver.waitFor(find.text('https://192.168.15.12:8443'));
      await driver.tap(conexaoSwitchForm);
      await driver.tap(conexaoConclusao);

      expect(await driver.getText(find.text('Teste 2')), 'Teste 2');
      expect(await driver.getText(find.text('https://192.168.15.12:8443')),
          'https://192.168.15.12:8443');
    });
    test('Teste conexão - remocao de conexão valida.', () async {
      await driver.tap(conexaoExclusao);
    });
    // test('Teste menu - digitos', () async {
    //   await driver.tap(drawerDigitos);
    //   await driver.tap(drawerDigitosForm);
    //   await driver.enterText('8888888');
    //   await driver.waitFor(find.text('8888888'));
    //   await driver.waitFor(drawerDigitosButton);
    //   await driver.tap(drawerDigitosButton);
    //   print('clicked and saved value on menu - digitos drawer');

    //   await driver.tap(drawerDigitos);
    //   await driver.tap(drawerDigitosForm);
    //   await driver.waitFor(find.text('8888888'));
    //   await driver.waitFor(drawerDigitosButton);
    //   await driver.tap(drawerDigitosButton);
    //   print('restored value on menu - digitos drawer');

    //   await driver.tap(drawerDigitos);
    //   await driver.tap(drawerDigitosForm);
    //   await driver.enterText('222222');
    //   await driver.waitFor(find.text('222222'));
    //   await driver.waitFor(drawerDigitosButton);
    //   await driver.tap(drawerDigitosButton);
    //   print('new value on menu - digitos drawer');

    //   await driver.tap(drawerDigitos);
    //   await driver.tap(drawerDigitosForm);
    //   await driver.enterText('f');
    //   await driver.waitFor(find.text('f'));
    //   await driver.waitFor(drawerDigitosButton);
    //   await driver.tap(drawerDigitosButton);
    //   expect(await driver.getText(find.text('Permitido somente números.')),
    //       'Permitido somente números.');
    //   print('insert numeric on menu - digitos drawer');

    //   await driver.enterText('33');
    //   await driver.waitFor(find.text('33'));
    //   await driver.waitFor(drawerDigitosButton);
    //   await driver.tap(drawerDigitosButton);
    //   expect(
    //       await driver
    //           .getText(find.text('Valor inserido não está entre 6 e 15.')),
    //       'Valor inserido não está entre 6 e 15.');
    //   print('insert wrong length on menu - digitos drawer');
    // });
  });
}
