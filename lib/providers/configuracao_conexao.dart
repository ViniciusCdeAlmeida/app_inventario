import 'package:flutter/material.dart';

import '../models/conexao.dart';

class ConfiguracaoConexao with ChangeNotifier {
  List<Conexao> _conexao = [];

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
    notifyListeners();
  }

  void atualizarConexao(String id, Conexao novaConexao) {
    final conexaoIdx = _conexao.indexWhere((value) => value.id == id);
    if (conexaoIdx >= 0) {
      _conexao[conexaoIdx] = novaConexao;
      notifyListeners();
    }
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
    notifyListeners();
  }

  void deletarConexao(String id) {
    _conexao.removeWhere((value) => value.id == id);
    notifyListeners();
  }
}
