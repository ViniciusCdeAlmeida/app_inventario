import 'package:app_inventario/helpers/index.dart';
import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/index.dart';

class Conexoes {
  Future salvaConexao(Conexao conexao) async {
    if (conexao.ativo) {
      await db.conexaoDao.updateDesativaConexoes();
    }
    await db.conexaoDao.insertConexao(conexao);
  }

  Future<Conexao> buscarConexao(int id) async =>
      helperConexao(await db.conexaoDao.getConexao(id));

  Future<List<Conexao>> buscarConexoes() async =>
      helperConexoes(await db.conexaoDao.getConexoes());

  Future<void> editaConexao(Conexao conexao) async {
    if (conexao.ativo) {
      await db.conexaoDao.updateDesativaConexoes();
    }
    await db.conexaoDao.updateConexao(conexao);
  }

  Future<void> deletaConexao(int id) async =>
      await db.conexaoDao.deleteConexao(id);

  Future<Conexao> buscaConexaoAtiva() async =>
      helperConexao(await db.conexaoDao.getConexaoAtiva());

  // void ativarConexao(String id) {
  // _conexao.forEach(
  //   (element) {
  //     if (element.ativo == true) element.ativo = false;
  //   },
  // );
  // atualizarConexaoAtiva(id);
  // }

  // void atualizarConexaoAtiva(String id) {
  // final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
  // if (!_conexao[conexaoIdx].ativo) {
  //   _conexao[conexaoIdx].ativo = true;
  // } else {
  //   _conexao[conexaoIdx].ativo = false;
  // }
  // }
}
