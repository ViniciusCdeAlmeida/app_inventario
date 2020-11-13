// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<LoginState> _$loginStateComputed;

  @override
  LoginState get loginState =>
      (_$loginStateComputed ??= Computed<LoginState>(() => super.loginState,
              name: '_LoginStore.loginState'))
          .value;

  final _$logandoAtom = Atom(name: '_LoginStore.logando');

  @override
  bool get logando {
    _$logandoAtom.reportRead();
    return super.logando;
  }

  @override
  set logando(bool value) {
    _$logandoAtom.reportWrite(value, super.logando, () {
      super.logando = value;
    });
  }

  final _$_qtdeItensAtom = Atom(name: '_LoginStore._qtdeItens');

  @override
  int get _qtdeItens {
    _$_qtdeItensAtom.reportRead();
    return super._qtdeItens;
  }

  @override
  set _qtdeItens(int value) {
    _$_qtdeItensAtom.reportWrite(value, super._qtdeItens, () {
      super._qtdeItens = value;
    });
  }

  final _$_qtdeItensTotalAtom = Atom(name: '_LoginStore._qtdeItensTotal');

  @override
  int get _qtdeItensTotal {
    _$_qtdeItensTotalAtom.reportRead();
    return super._qtdeItensTotal;
  }

  @override
  set _qtdeItensTotal(int value) {
    _$_qtdeItensTotalAtom.reportWrite(value, super._qtdeItensTotal, () {
      super._qtdeItensTotal = value;
    });
  }

  final _$_progressAtom = Atom(name: '_LoginStore._progress');

  @override
  double get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(double value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  final _$_usuarioLogadoAtom = Atom(name: '_LoginStore._usuarioLogado');

  @override
  Login get _usuarioLogado {
    _$_usuarioLogadoAtom.reportRead();
    return super._usuarioLogado;
  }

  @override
  set _usuarioLogado(Login value) {
    _$_usuarioLogadoAtom.reportWrite(value, super._usuarioLogado, () {
      super._usuarioLogado = value;
    });
  }

  final _$_loginFutureAtom = Atom(name: '_LoginStore._loginFuture');

  @override
  ObservableFuture<Login> get _loginFuture {
    _$_loginFutureAtom.reportRead();
    return super._loginFuture;
  }

  @override
  set _loginFuture(ObservableFuture<Login> value) {
    _$_loginFutureAtom.reportWrite(value, super._loginFuture, () {
      super._loginFuture = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<dynamic> login(String usuario, String senha) {
    return _$loginAsyncAction.run(() => super.login(usuario, senha));
  }

  @override
  String toString() {
    return '''
logando: ${logando},
loginState: ${loginState}
    ''';
  }
}
