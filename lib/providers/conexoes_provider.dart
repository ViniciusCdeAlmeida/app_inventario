import 'package:GRPInventario/helpers/index_helpers.dart';
import 'package:GRPInventario/main.dart';
import 'package:GRPInventario/models/index_models.dart';

class ConexoesProvider {
  Future salvaConexao(Conexao conexao) async {
    if (conexao.ativo) {
      await db.conexaoDao.updateDesativaConexoes();
    }
    return await db.conexaoDao.insertConexao(conexao);
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
}
