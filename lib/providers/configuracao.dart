import 'package:app_inventario/helpers/helper_mascara.dart';
import 'package:app_inventario/helpers/helper_prefixo.dart';
import 'package:app_inventario/models/serialized/mascara.dart';
import 'package:app_inventario/models/serialized/prefixo.dart';

import '../models/serialized/conexao.dart';
import 'package:app_inventario/main.dart';

class Configuracao {
  List<Conexao> _conexao = [
    Conexao(
      url: 'https://192.168.15.2:8443',
      nome: 'Teste App',
      ativo: true,
      id: 1,
      // url: 'https://grp-frotaspoc.centralit.com.br',
      // nome: 'Teste App',
      // ativo: true,
      // id: '1',
    )
  ];

  List<Conexao> get conexoes {
    return [..._conexao];
  }

  Conexao findById(int id) {
    return _conexao.firstWhere((value) => value.id == id);
  }

  void adicionarConexao(Conexao conexao) {
    final novaConexao = Conexao(
      id: 1,
      url: conexao.url,
      nome: conexao.nome,
      ativo: conexao.ativo == null ? false : conexao.ativo,
    );
    _conexao.add(novaConexao);
  }

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

  void atualizarConexao(int id, Conexao novaConexao) {
    final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
    if (conexaoIdx >= 0) {
      _conexao[conexaoIdx] = novaConexao;
    }
  }

  void ativarConexao(int id) {
    _conexao.forEach(
      (element) {
        if (element.ativo == true) element.ativo = false;
      },
    );
    atualizarConexaoAtiva(id);
  }

  bool verificaConexaoAtiva() {
    int teste = _conexao.indexWhere((value) => value.ativo == true);
    if (teste != -1) {
      return true;
    } else {
      return false;
    }
  }

  void atualizarConexaoAtiva(int id) {
    final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
    if (!_conexao[conexaoIdx].ativo) {
      _conexao[conexaoIdx].ativo = true;
    } else {
      _conexao[conexaoIdx].ativo = false;
    }
  }
}
