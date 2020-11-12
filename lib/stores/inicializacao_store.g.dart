// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inicializacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InicializacaoStore on _InicializacaoStore, Store {
  Computed<InicializacaoState> _$inicializacaoStateComputed;

  @override
  InicializacaoState get inicializacaoState => (_$inicializacaoStateComputed ??=
          Computed<InicializacaoState>(() => super.inicializacaoState,
              name: '_InicializacaoStore.inicializacaoState'))
      .value;
  Computed<int> _$qtdeItensComputed;

  @override
  int get qtdeItens =>
      (_$qtdeItensComputed ??= Computed<int>(() => super.qtdeItens,
              name: '_InicializacaoStore.qtdeItens'))
          .value;

  final _$existeDominioAtom = Atom(name: '_InicializacaoStore.existeDominio');

  @override
  bool get existeDominio {
    _$existeDominioAtom.reportRead();
    return super.existeDominio;
  }

  @override
  set existeDominio(bool value) {
    _$existeDominioAtom.reportWrite(value, super.existeDominio, () {
      super.existeDominio = value;
    });
  }

  final _$existeBensPatrimoniaisAtom =
      Atom(name: '_InicializacaoStore.existeBensPatrimoniais');

  @override
  bool get existeBensPatrimoniais {
    _$existeBensPatrimoniaisAtom.reportRead();
    return super.existeBensPatrimoniais;
  }

  @override
  set existeBensPatrimoniais(bool value) {
    _$existeBensPatrimoniaisAtom
        .reportWrite(value, super.existeBensPatrimoniais, () {
      super.existeBensPatrimoniais = value;
    });
  }

  final _$buscandoBensPatrimoniaisAtom =
      Atom(name: '_InicializacaoStore.buscandoBensPatrimoniais');

  @override
  bool get buscandoBensPatrimoniais {
    _$buscandoBensPatrimoniaisAtom.reportRead();
    return super.buscandoBensPatrimoniais;
  }

  @override
  set buscandoBensPatrimoniais(bool value) {
    _$buscandoBensPatrimoniaisAtom
        .reportWrite(value, super.buscandoBensPatrimoniais, () {
      super.buscandoBensPatrimoniais = value;
    });
  }

  final _$_qtdeItensAtom = Atom(name: '_InicializacaoStore._qtdeItens');

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

  final _$_qtdeItensTotalAtom =
      Atom(name: '_InicializacaoStore._qtdeItensTotal');

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

  final _$_progressAtom = Atom(name: '_InicializacaoStore._progress');

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

  final _$organizacoesAtom = Atom(name: '_InicializacaoStore.organizacoes');

  @override
  List<Organizacoes> get organizacoes {
    _$organizacoesAtom.reportRead();
    return super.organizacoes;
  }

  @override
  set organizacoes(List<Organizacoes> value) {
    _$organizacoesAtom.reportWrite(value, super.organizacoes, () {
      super.organizacoes = value;
    });
  }

  final _$_organizacoesFutureAtom =
      Atom(name: '_InicializacaoStore._organizacoesFuture');

  @override
  ObservableFuture<dynamic> get _organizacoesFuture {
    _$_organizacoesFutureAtom.reportRead();
    return super._organizacoesFuture;
  }

  @override
  set _organizacoesFuture(ObservableFuture<dynamic> value) {
    _$_organizacoesFutureAtom.reportWrite(value, super._organizacoesFuture, () {
      super._organizacoesFuture = value;
    });
  }

  final _$_dominioFutureAtom = Atom(name: '_InicializacaoStore._dominioFuture');

  @override
  ObservableFuture<dynamic> get _dominioFuture {
    _$_dominioFutureAtom.reportRead();
    return super._dominioFuture;
  }

  @override
  set _dominioFuture(ObservableFuture<dynamic> value) {
    _$_dominioFutureAtom.reportWrite(value, super._dominioFuture, () {
      super._dominioFuture = value;
    });
  }

  final _$_bensPatrimoniaisFutureAtom =
      Atom(name: '_InicializacaoStore._bensPatrimoniaisFuture');

  @override
  ObservableFuture<dynamic> get _bensPatrimoniaisFuture {
    _$_bensPatrimoniaisFutureAtom.reportRead();
    return super._bensPatrimoniaisFuture;
  }

  @override
  set _bensPatrimoniaisFuture(ObservableFuture<dynamic> value) {
    _$_bensPatrimoniaisFutureAtom
        .reportWrite(value, super._bensPatrimoniaisFuture, () {
      super._bensPatrimoniaisFuture = value;
    });
  }

  final _$_getBensPatrimoniaisAsyncAction =
      AsyncAction('_InicializacaoStore._getBensPatrimoniais');

  @override
  Future<dynamic> _getBensPatrimoniais(String conexao) {
    return _$_getBensPatrimoniaisAsyncAction
        .run(() => super._getBensPatrimoniais(conexao));
  }

  final _$_getDominiosAsyncAction =
      AsyncAction('_InicializacaoStore._getDominios');

  @override
  Future<dynamic> _getDominios(String conexao) {
    return _$_getDominiosAsyncAction.run(() => super._getDominios(conexao));
  }

  final _$verificaOrganizacoesAsyncAction =
      AsyncAction('_InicializacaoStore.verificaOrganizacoes');

  @override
  Future<dynamic> verificaOrganizacoes() {
    return _$verificaOrganizacoesAsyncAction
        .run(() => super.verificaOrganizacoes());
  }

  final _$verificaInicializacaoAsyncAction =
      AsyncAction('_InicializacaoStore.verificaInicializacao');

  @override
  Future<dynamic> verificaInicializacao(String conexao) {
    return _$verificaInicializacaoAsyncAction
        .run(() => super.verificaInicializacao(conexao));
  }

  @override
  String toString() {
    return '''
existeDominio: ${existeDominio},
existeBensPatrimoniais: ${existeBensPatrimoniais},
buscandoBensPatrimoniais: ${buscandoBensPatrimoniais},
organizacoes: ${organizacoes},
inicializacaoState: ${inicializacaoState},
qtdeItens: ${qtdeItens}
    ''';
  }
}
