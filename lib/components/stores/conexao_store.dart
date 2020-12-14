import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/providers/index_providers.dart';

import 'package:mobx/mobx.dart';

part 'conexao_store.g.dart';

class ConexaoStore = _ConexaoStore with _$ConexaoStore;

enum ConexoesState {
  inicial,
  carregando,
  carregado,
}
enum ConexaoState {
  inicial,
  carregando,
  carregado,
}

abstract class _ConexaoStore with Store {
  final ConexoesProvider _conexoesProvider;

  _ConexaoStore(this._conexoesProvider);

  @observable
  Conexao _conexao;

  Conexao _conexaoAtiva;

  @observable
  ObservableList<Conexao> _conexoesObservable = ObservableList<Conexao>();

  @observable
  ObservableFuture<List<Conexao>> _conexoesFuture;

  @observable
  ObservableFuture<Conexao> _conexaoFuture;

  @computed
  List<Conexao> get conexoes {
    return [..._conexoesObservable];
  }

  @computed
  Conexao get conexao {
    return _conexao;
  }

  Conexao get conexaoAtiva {
    return _conexaoAtiva;
  }

  @computed
  // ignore: missing_return
  ConexoesState get conexoesState {
    if ((_conexoesFuture == null ||
        _conexoesFuture.status == FutureStatus.rejected)) {
      return ConexoesState.inicial;
    }

    if (_conexoesFuture.status == FutureStatus.pending) {
      return ConexoesState.carregando;
    }

    if (_conexoesFuture.status == FutureStatus.fulfilled &&
        _conexoesObservable != null) return ConexoesState.carregado;
  }

  @computed
  // ignore: missing_return
  ConexaoState get conexaoState {
    if ((_conexaoFuture == null ||
        _conexaoFuture.status == FutureStatus.rejected)) {
      return ConexaoState.inicial;
    }

    if (_conexaoFuture.status == FutureStatus.pending) {
      return ConexaoState.carregando;
    }

    if (_conexaoFuture.status == FutureStatus.fulfilled && _conexao != null)
      return ConexaoState.carregado;
  }

  @action
  void limpaDados() {
    _conexao.ativo = false;
    _conexao.id = null;
    _conexao.nome = '';
    _conexao.url = '';
  }

  @action
  Future salvarConexao({Conexao conexao, bool existente, int id}) async {
    try {
      if (existente) {
        _conexoesProvider.editaConexao(conexao).then((_) {
          if (conexao.ativo) {
            _conexoesObservable.clear();
            buscarConexoes();
          }
        });
      } else
        _conexoesProvider.salvaConexao(conexao).then((_) {
          if (conexao.ativo) {
            _conexoesObservable.clear();
            buscarConexoes();
          }
          _conexoesObservable.add(conexao);
        });
    } catch (e) {
      throw e;
    }
  }

  @action
  Future buscarConexoes() async {
    try {
      _conexoesFuture = ObservableFuture(
        _conexoesProvider.buscarConexoes(),
      );
      _conexoesObservable = (await _conexoesFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future buscarConexao(int id) async {
    try {
      _conexaoFuture = ObservableFuture(
        _conexoesProvider.buscarConexao(id),
      );
      _conexao = await _conexaoFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  Future deletaConexao(int id) async {
    try {
      await _conexoesProvider.deletaConexao(id);
      var idx = _conexoesObservable.indexWhere((element) => element.id == id);
      _conexoesObservable.removeAt(idx);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future ativaConexao() async {
    // try {
    //   _conexaoFuture = ObservableFuture(
    //     _conexoes.buscaMascara(),
    //   );
    //   _mascara = await _conexaoFuture;
    // } catch (e) {
    //   throw e;
    // }
  }

  Future buscaConexaoAtiva() async {
    try {
      _conexaoAtiva = await _conexoesProvider.buscaConexaoAtiva();
    } catch (e) {
      throw e;
    }
  }
}
