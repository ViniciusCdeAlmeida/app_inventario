import 'package:GRPInventario/helpers/index.dart';
import 'package:GRPInventario/models/serialized/index.dart';

import 'package:GRPInventario/main.dart';

class Configuracao {
  Future salvaMascara(String mascara) async =>
      db.configuracaoDao.insertMascara(mascara);

  Future salvaPrefixo(String prefixo) async =>
      db.configuracaoDao.insertPrefixo(prefixo);

  Future<Mascara> buscaMascara() async {
    var _mascara = await db.configuracaoDao.getMascara();
    if (_mascara != null)
      return helperMascara(_mascara);
    else
      return null;
  }

  Future<Prefixo> buscaPrefixo() async {
    var _prefixo = await db.configuracaoDao.getPrefixo();
    if (_prefixo != null)
      return helperPrefixo(_prefixo);
    else
      return null;
  }

  Future editaMascara(String mascara, int id) async =>
      await db.configuracaoDao.updateMascara(mascara, id);

  Future editaPrefixo(String prefixo, int id) async =>
      await db.configuracaoDao.updatePrefixo(prefixo, id);
}
