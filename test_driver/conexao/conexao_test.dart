import 'package:GRPInventario/utils/keys_utils.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  conexaoTest();
}

Future<void> conexaoTest() async {
  group('Conexão ->', () {
    FlutterDriver driver;

    final conexao = find.byValueKey(Keys.conexaoDrawer);
    final conexaoAdicao = find.byValueKey(Keys.conexaoAdicaoButton);
    final conexaoExclusao = find.byValueKey(Keys.conexaoExclusaoButton);
    final conexaoEdicao = find.byValueKey(Keys.conexaoEdicaoButton);
    final conexaoConclusao = find.byValueKey(Keys.conexaoConclusaoButton);
    final conexaoUrlForm = find.byValueKey(Keys.conexaoAdicaoUrlForm);
    final conexaoNomeForm = find.byValueKey(Keys.conexaoAdicaoNomeForm);
    final conexaoSwitchForm = find.byValueKey(Keys.conexaoAdicaoSwitchForm);

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Teste menu - abrir tela de listagem - conexão.', () async {
      await driver.tap(conexao);
    });

    test(
        'Teste conexão - abrir tela de adição e inserir url e nome invalidas - conexão.',
        () async {
      await driver.tap(conexaoAdicao);
      await driver.tap(conexaoConclusao);
      expect(await driver.getText(find.text('Informe o Nome.')),
          'Informe o Nome.');
      expect(
          await driver.getText(find.text('Informe a URL.')), 'Informe a URL.');
    });

    test(
        'Teste conexão - abrir tela de adição e inserir url invalida - conexão.',
        () async {
      await driver.tap(conexaoNomeForm);
      await driver.enterText('Conexao teste');
      await driver.waitFor(find.text('Conexao teste'));
      expect(
          await driver.getText(find.text('Informe a URL.')), 'Informe a URL.');
    });

    test(
        'Teste conexão - abrir tela de adicao e inserir nome invalido - conexão.',
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

    test('Teste conexão - adição de um item valido - conexão.', () async {
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

    test('Teste conexão - edição de um item valido - conexão.', () async {
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

    test('Teste conexão - remoção - conexão.', () async {
      await driver.tap(conexaoExclusao);
    });
  });
}
