import 'package:test/test.dart';

import 'conexao/conexao_test.dart';
import 'drawer/drawer_test.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    drawerTest();
    conexaoTest();
  });
}
