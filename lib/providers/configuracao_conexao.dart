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

  void deletarConexao(String id) {
    _conexao.removeWhere((value) => value.id == id);
    notifyListeners();
  }
}
