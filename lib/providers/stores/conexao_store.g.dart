// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conexao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConexaoStore on _ConexaoStore, Store {
  Computed<List<Conexao>> _$conexoesComputed;

  @override
  List<Conexao> get conexoes =>
      (_$conexoesComputed ??= Computed<List<Conexao>>(() => super.conexoes,
              name: '_ConexaoStore.conexoes'))
          .value;
  Computed<Conexao> _$conexaoComputed;

  @override
  Conexao get conexao => (_$conexaoComputed ??=
          Computed<Conexao>(() => super.conexao, name: '_ConexaoStore.conexao'))
      .value;
  Computed<ConexoesState> _$conexoesStateComputed;

  @override
  ConexoesState get conexoesState => (_$conexoesStateComputed ??=
          Computed<ConexoesState>(() => super.conexoesState,
              name: '_ConexaoStore.conexoesState'))
      .value;
  Computed<ConexaoState> _$conexaoStateComputed;

  @override
  ConexaoState get conexaoState => (_$conexaoStateComputed ??=
          Computed<ConexaoState>(() => super.conexaoState,
              name: '_ConexaoStore.conexaoState'))
      .value;

  final _$_conexaoAtom = Atom(name: '_ConexaoStore._conexao');

  @override
  Conexao get _conexao {
    _$_conexaoAtom.reportRead();
    return super._conexao;
  }

  @override
  set _conexao(Conexao value) {
    _$_conexaoAtom.reportWrite(value, super._conexao, () {
      super._conexao = value;
    });
  }

  final _$_conexoesObservableAtom =
      Atom(name: '_ConexaoStore._conexoesObservable');

  @override
  ObservableList<Conexao> get _conexoesObservable {
    _$_conexoesObservableAtom.reportRead();
    return super._conexoesObservable;
  }

  @override
  set _conexoesObservable(ObservableList<Conexao> value) {
    _$_conexoesObservableAtom.reportWrite(value, super._conexoesObservable, () {
      super._conexoesObservable = value;
    });
  }

  final _$_conexoesFutureAtom = Atom(name: '_ConexaoStore._conexoesFuture');

  @override
  ObservableFuture<List<Conexao>> get _conexoesFuture {
    _$_conexoesFutureAtom.reportRead();
    return super._conexoesFuture;
  }

  @override
  set _conexoesFuture(ObservableFuture<List<Conexao>> value) {
    _$_conexoesFutureAtom.reportWrite(value, super._conexoesFuture, () {
      super._conexoesFuture = value;
    });
  }

  final _$_conexaoFutureAtom = Atom(name: '_ConexaoStore._conexaoFuture');

  @override
  ObservableFuture<Conexao> get _conexaoFuture {
    _$_conexaoFutureAtom.reportRead();
    return super._conexaoFuture;
  }

  @override
  set _conexaoFuture(ObservableFuture<Conexao> value) {
    _$_conexaoFutureAtom.reportWrite(value, super._conexaoFuture, () {
      super._conexaoFuture = value;
    });
  }

  final _$salvarConexaoAsyncAction = AsyncAction('_ConexaoStore.salvarConexao');

  @override
  Future<dynamic> salvarConexao({Conexao conexao, bool existente, int id}) {
    return _$salvarConexaoAsyncAction.run(() =>
        super.salvarConexao(conexao: conexao, existente: existente, id: id));
  }

  final _$buscarConexoesAsyncAction =
      AsyncAction('_ConexaoStore.buscarConexoes');

  @override
  Future<dynamic> buscarConexoes() {
    return _$buscarConexoesAsyncAction.run(() => super.buscarConexoes());
  }

  final _$buscarConexaoAsyncAction = AsyncAction('_ConexaoStore.buscarConexao');

  @override
  Future<dynamic> buscarConexao(int id) {
    return _$buscarConexaoAsyncAction.run(() => super.buscarConexao(id));
  }

  final _$deletaConexaoAsyncAction = AsyncAction('_ConexaoStore.deletaConexao');

  @override
  Future<dynamic> deletaConexao(int id) {
    return _$deletaConexaoAsyncAction.run(() => super.deletaConexao(id));
  }

  final _$ativaConexaoAsyncAction = AsyncAction('_ConexaoStore.ativaConexao');

  @override
  Future<dynamic> ativaConexao() {
    return _$ativaConexaoAsyncAction.run(() => super.ativaConexao());
  }

  final _$_ConexaoStoreActionController =
      ActionController(name: '_ConexaoStore');

  @override
  void limpaDados() {
    final _$actionInfo = _$_ConexaoStoreActionController.startAction(
        name: '_ConexaoStore.limpaDados');
    try {
      return super.limpaDados();
    } finally {
      _$_ConexaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conexoes: ${conexoes},
conexao: ${conexao},
conexoesState: ${conexoesState},
conexaoState: ${conexaoState}
    ''';
  }
}
