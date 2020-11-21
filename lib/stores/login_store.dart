import 'package:app_inventario/models/serialized/login.dart';
import 'package:app_inventario/providers/autenticacao.dart';

import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

enum LoginState {
  inicial,
  logando,
  logado,
}

abstract class _LoginStore with Store {
  final Autenticacao _autenticacao;

  _LoginStore(this._autenticacao);

  @observable
  bool logando = false;

  @observable
  int _qtdeItens = 0;

  @observable
  bool _loginOffline = false;

  @observable
  int _qtdeItensTotal = 0;

  @observable
  double _progress = 0.0;

  @observable
  Login _usuarioLogado;

  @observable
  ObservableFuture<Login> _loginFuture;

  Login get usuarioLogado {
    return _usuarioLogado;
  }

  bool get usuarioOffline {
    return _loginOffline;
  }

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
  void loginOffline(bool status) {
    _loginOffline = status;
  }

  @action
  Future logarOffline() async {
    logando = true;
    try {
      _loginFuture = ObservableFuture(
        _autenticacao.login(offline: _loginOffline),
      );
      _usuarioLogado = await _loginFuture.whenComplete(() => logando = false);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future login(String usuario, String senha) async {
    logando = true;
    try {
      _loginFuture = ObservableFuture(
        _autenticacao.login(
          userName: usuario,
          password: senha,
          offline: _loginOffline,
        ),
      );
      _usuarioLogado = await _loginFuture.whenComplete(() => logando = false);
    } catch (e) {
      throw e;
    }
  }
}
