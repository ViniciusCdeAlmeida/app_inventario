// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracaoStore on _ConfiguracaoStore, Store {
  Computed<MascaraState> _$mascaraStateComputed;

  @override
  MascaraState get mascaraState => (_$mascaraStateComputed ??=
          Computed<MascaraState>(() => super.mascaraState,
              name: '_ConfiguracaoStore.mascaraState'))
      .value;
  Computed<MascaraState> _$prefixoStateComputed;

  @override
  MascaraState get prefixoState => (_$prefixoStateComputed ??=
          Computed<MascaraState>(() => super.prefixoState,
              name: '_ConfiguracaoStore.prefixoState'))
      .value;

  final _$logandoAtom = Atom(name: '_ConfiguracaoStore.logando');

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

  final _$_mascaraAtom = Atom(name: '_ConfiguracaoStore._mascara');

  @override
  Mascara get _mascara {
    _$_mascaraAtom.reportRead();
    return super._mascara;
  }

  @override
  set _mascara(Mascara value) {
    _$_mascaraAtom.reportWrite(value, super._mascara, () {
      super._mascara = value;
    });
  }

  final _$_prefixoAtom = Atom(name: '_ConfiguracaoStore._prefixo');

  @override
  Prefixo get _prefixo {
    _$_prefixoAtom.reportRead();
    return super._prefixo;
  }

  @override
  set _prefixo(Prefixo value) {
    _$_prefixoAtom.reportWrite(value, super._prefixo, () {
      super._prefixo = value;
    });
  }

  final _$_prefixoFutureAtom = Atom(name: '_ConfiguracaoStore._prefixoFuture');

  @override
  ObservableFuture<Prefixo> get _prefixoFuture {
    _$_prefixoFutureAtom.reportRead();
    return super._prefixoFuture;
  }

  @override
  set _prefixoFuture(ObservableFuture<Prefixo> value) {
    _$_prefixoFutureAtom.reportWrite(value, super._prefixoFuture, () {
      super._prefixoFuture = value;
    });
  }

  final _$_mascaraFutureAtom = Atom(name: '_ConfiguracaoStore._mascaraFuture');

  @override
  ObservableFuture<Mascara> get _mascaraFuture {
    _$_mascaraFutureAtom.reportRead();
    return super._mascaraFuture;
  }

  @override
  set _mascaraFuture(ObservableFuture<Mascara> value) {
    _$_mascaraFutureAtom.reportWrite(value, super._mascaraFuture, () {
      super._mascaraFuture = value;
    });
  }

  final _$salvarPrefixoAsyncAction =
      AsyncAction('_ConfiguracaoStore.salvarPrefixo');

  @override
  Future<dynamic> salvarPrefixo({String prefixo, bool existente, int id}) {
    return _$salvarPrefixoAsyncAction.run(() =>
        super.salvarPrefixo(prefixo: prefixo, existente: existente, id: id));
  }

  final _$salvarMascaraAsyncAction =
      AsyncAction('_ConfiguracaoStore.salvarMascara');

  @override
  Future<dynamic> salvarMascara({String mascara, bool existente, int id}) {
    return _$salvarMascaraAsyncAction.run(() =>
        super.salvarMascara(mascara: mascara, existente: existente, id: id));
  }

  final _$buscarMascaraAsyncAction =
      AsyncAction('_ConfiguracaoStore.buscarMascara');

  @override
  Future<dynamic> buscarMascara() {
    return _$buscarMascaraAsyncAction.run(() => super.buscarMascara());
  }

  final _$buscarPrefixoAsyncAction =
      AsyncAction('_ConfiguracaoStore.buscarPrefixo');

  @override
  Future<dynamic> buscarPrefixo() {
    return _$buscarPrefixoAsyncAction.run(() => super.buscarPrefixo());
  }

  @override
  String toString() {
    return '''
logando: ${logando},
mascaraState: ${mascaraState},
prefixoState: ${prefixoState}
    ''';
  }
}
