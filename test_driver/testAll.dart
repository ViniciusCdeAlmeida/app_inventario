import 'dart:convert';
import 'package:GRPInventario/helpers/organizacoes_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:GRPInventario/main.dart' as app;

Future<void> main() async {
  // ignore: missing_return
  Future<String> dataHandler(String msg) async {
    switch (msg) {
      case 'inicializacao':
        inicializacaoSeedDb();
        inventariosSeedDb();
        estruturasSeedDb();
        break;
      case 'cleanDatabase':
        cleanDb();
        break;
    }
  }

  enableFlutterDriverExtension(handler: dataHandler);

  app.main();
}

inicializacaoSeedDb() async {
  ByteData data = await rootBundle.load('assets/resources/organizacoes.json');
  var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
  app.db.unidadesGestorasDao.insertUnidadeGestora(json['organizacoes'] as List);
  app.db.usuarioDao.updateUsuario(
    helperOrganizacoesLista(json['organizacoes'] as List),
  );

  data = await rootBundle.load('assets/resources/bensPatrimoniais.json');
  json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
  app.db.bemPatrimoniaisDao.insertBensPatrimoniais(json['objects'] as List);

  data = await rootBundle.load('assets/resources/dominios.json');
  json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
  app.db.dominioDao.insertDominio(json['payload'] as List);
}

inventariosSeedDb() async {
  var data = await rootBundle.load('assets/resources/inventario.json');
  var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
  app.db.inventariosDao.insertLevantamentos(json['payload'] as List);
}

estruturasSeedDb() async {
  var data = await rootBundle.load('assets/resources/estruturas.json');
  var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
  app.db.estruturaInventarioDao
      .insertEstruturaInventario(json['objects'] as List);
}

cleanDb() async {
  app.db.deleteTables(app.db.allTables.toList());
}
