import 'package:GRPInventario/models/serialized/mascara.dart';
import 'package:GRPInventario/models/serialized/prefixo.dart';
import 'package:GRPInventario/providers/configuracao.dart';

import 'package:mobx/mobx.dart';

part 'configuracao_store.g.dart';

class ConfiguracaoStore = _ConfiguracaoStore with _$ConfiguracaoStore;

enum PrefixoState { inicial, carregando, carregado }

enum MascaraState { inicial, carregando, carregado }

abstract class _ConfiguracaoStore with Store {
  final Configuracao _configuracao;

  _ConfiguracaoStore(this._configuracao);

  @observable
  bool logando = false;

  @observable
  Mascara _mascara;

  @observable
  Prefixo _prefixo;

  @observable
  ObservableFuture<Prefixo> _prefixoFuture;

  @observable
  ObservableFuture<Mascara> _mascaraFuture;

  Prefixo get prefixo {
    return _prefixo;
  }

  Mascara get mascara {
    return _mascara;
  }

  @computed
  // ignore: missing_return
  MascaraState get mascaraState {
    if ((_mascaraFuture == null ||
        _mascaraFuture.status == FutureStatus.rejected)) {
      return MascaraState.inicial;
    }

    if (_mascaraFuture.status == FutureStatus.pending) {
      return MascaraState.carregando;
    }

    if (_mascaraFuture.status == FutureStatus.fulfilled)
      return MascaraState.carregado;
  }

  @computed
  // ignore: missing_return
  MascaraState get prefixoState {
    if ((_prefixoFuture == null ||
        _prefixoFuture.status == FutureStatus.rejected)) {
      return MascaraState.inicial;
    }

    if (_prefixoFuture.status == FutureStatus.pending) {
      return MascaraState.carregando;
    }

    if (_prefixoFuture.status == FutureStatus.fulfilled)
      return MascaraState.carregado;
  }

  @action
  Future salvarPrefixo({String prefixo, bool existente, int id}) async {
    try {
      if (!existente)
        _configuracao.editaPrefixo(prefixo, id);
      else
        _configuracao.salvaPrefixo(prefixo);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future salvarMascara({String mascara, bool existente, int id}) async {
    try {
      if (!existente)
        _configuracao.editaMascara(mascara, id);
      else
        _configuracao.salvaMascara(mascara);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future buscarMascara() async {
    try {
      _mascaraFuture = ObservableFuture(
        _configuracao.buscaMascara(),
      );
      _mascara = await _mascaraFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  Future buscarPrefixo() async {
    try {
      _prefixoFuture = ObservableFuture(
        _configuracao.buscaPrefixo(),
      );
      _prefixo = await _prefixoFuture;
    } catch (e) {
      throw e;
    }
  }
}
