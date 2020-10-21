// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inicializacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InicializacaoStore on _InicializacaoStore, Store {
  Computed<OrganizacoesState> _$organizacoesStateComputed;

  @override
  OrganizacoesState get organizacoesState => (_$organizacoesStateComputed ??=
          Computed<OrganizacoesState>(() => super.organizacoesState,
              name: '_InicializacaoStore.organizacoesState'))
      .value;
  Computed<InicializacaoState> _$inicializacaoStateComputed;

  @override
  InicializacaoState get inicializacaoState => (_$inicializacaoStateComputed ??=
          Computed<InicializacaoState>(() => super.inicializacaoState,
              name: '_InicializacaoStore.inicializacaoState'))
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
organizacoesState: ${organizacoesState},
inicializacaoState: ${inicializacaoState}
    ''';
  }
}
