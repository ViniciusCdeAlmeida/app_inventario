import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/configuracao_conexao.dart';

import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

enum LoginState {
  inicial,
  logando,
  logado,
}

abstract class _LoginStore with Store {
  final ConfiguracaoConexao _configuracaoConexao;
  final Autenticacao _autenticacao;

  _LoginStore(this._autenticacao, this._configuracaoConexao);

  @observable
  bool logando = false;

  @observable
  int _qtdeItens = 0;

  @observable
  int _qtdeItensTotal = 0;

  @observable
  double _progress = 0.0;

  @observable
  ObservableFuture _loginFuture;

  @computed
  // ignore: missing_return
  LoginState get loginState {
    if ((_loginFuture == null ||
        _loginFuture.status == FutureStatus.rejected)) {
      return LoginState.inicial;
    }

    if (_loginFuture.status == FutureStatus.pending) {
      return LoginState.logando;
    }

    if (_loginFuture.status == FutureStatus.fulfilled) return LoginState.logado;
  }

  @action
  Future login(String usuario, String senha) async {
    _autenticacao.conexaoAtual(_configuracaoConexao.conexoes);
    logando = true;
    try {
      _loginFuture = await ObservableFuture(
        _autenticacao.login(usuario, senha),
      ).whenComplete(() => logando = false);
    } catch (e) {
      print(e);
    }
  }
}
