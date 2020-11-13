import '../models/serialized/conexao.dart';

class ConfiguracaoConexao {
  List<Conexao> _conexao = [
    Conexao(
      // url: 'https://192.168.15.2:8443',
      // nome: 'Teste App',
      // ativo: true,
      // id: '1',
      url: 'https://grp-frotaspoc.centralit.com.br',
      nome: 'Teste App',
      ativo: true,
      id: '1',
    )
  ];

  List<Conexao> get conexoes {
    return [..._conexao];
  }

  Conexao findById(String id) {
    return _conexao.firstWhere((value) => value.id == id);
  }

  void adicionarConexao(Conexao conexao) {
    final novaConexao = Conexao(
      id: DateTime.now().toString(),
      url: conexao.url,
      nome: conexao.nome,
      ativo: conexao.ativo == null ? false : conexao.ativo,
    );
    _conexao.add(novaConexao);
  }

  void atualizarConexao(String id, Conexao novaConexao) {
    final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
    if (conexaoIdx >= 0) {
      _conexao[conexaoIdx] = novaConexao;
    }
  }

  void ativarConexao(String id) {
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

  void atualizarConexaoAtiva(String id) {
    final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
    if (!_conexao[conexaoIdx].ativo) {
      _conexao[conexaoIdx].ativo = true;
    } else {
      _conexao[conexaoIdx].ativo = false;
    }
  }

  void deletarConexao(String id) {
    _conexao.removeWhere((value) => value.id == id);
  }
}
