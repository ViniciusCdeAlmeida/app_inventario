// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levantamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LevantamentoStore on _LevantamentoStore, Store {
  Computed<LevantamentosState> _$inventarioStateComputed;

  @override
  LevantamentosState get inventarioState => (_$inventarioStateComputed ??=
          Computed<LevantamentosState>(() => super.inventarioState,
              name: '_LevantamentoStore.inventarioState'))
      .value;
  Computed<List<Levantamento>> _$levantamentosDadosComputed;

  @override
  List<Levantamento> get levantamentosDados => (_$levantamentosDadosComputed ??=
          Computed<List<Levantamento>>(() => super.levantamentosDados,
              name: '_LevantamentoStore.levantamentosDados'))
      .value;

  final _$_existeLevantamentoAtom =
      Atom(name: '_LevantamentoStore._existeLevantamento');

  @override
  bool get _existeLevantamento {
    _$_existeLevantamentoAtom.reportRead();
    return super._existeLevantamento;
  }

  @override
  set _existeLevantamento(bool value) {
    _$_existeLevantamentoAtom.reportWrite(value, super._existeLevantamento, () {
      super._existeLevantamento = value;
    });
  }

  final _$buscandoEstruturasAtom =
      Atom(name: '_LevantamentoStore.buscandoEstruturas');

  @override
  bool get buscandoEstruturas {
    _$buscandoEstruturasAtom.reportRead();
    return super.buscandoEstruturas;
  }

  @override
  set buscandoEstruturas(bool value) {
    _$buscandoEstruturasAtom.reportWrite(value, super.buscandoEstruturas, () {
      super.buscandoEstruturas = value;
    });
  }

  final _$atualizandoInvAtom = Atom(name: '_LevantamentoStore.atualizandoInv');

  @override
  bool get atualizandoInv {
    _$atualizandoInvAtom.reportRead();
    return super.atualizandoInv;
  }

  @override
  set atualizandoInv(bool value) {
    _$atualizandoInvAtom.reportWrite(value, super.atualizandoInv, () {
      super.atualizandoInv = value;
    });
  }

  final _$_levantamentoObservableAtom =
      Atom(name: '_LevantamentoStore._levantamentoObservable');

  @override
  Levantamento get _levantamentoObservable {
    _$_levantamentoObservableAtom.reportRead();
    return super._levantamentoObservable;
  }

  @override
  set _levantamentoObservable(Levantamento value) {
    _$_levantamentoObservableAtom
        .reportWrite(value, super._levantamentoObservable, () {
      super._levantamentoObservable = value;
    });
  }

  final _$_levantamentosObservableAtom =
      Atom(name: '_LevantamentoStore._levantamentosObservable');

  @override
  ObservableList<Levantamento> get _levantamentosObservable {
    _$_levantamentosObservableAtom.reportRead();
    return super._levantamentosObservable;
  }

  @override
  set _levantamentosObservable(ObservableList<Levantamento> value) {
    _$_levantamentosObservableAtom
        .reportWrite(value, super._levantamentosObservable, () {
      super._levantamentosObservable = value;
    });
  }

  final _$_levantamentosFutureAtom =
      Atom(name: '_LevantamentoStore._levantamentosFuture');

  @override
  ObservableFuture<List<Levantamento>> get _levantamentosFuture {
    _$_levantamentosFutureAtom.reportRead();
    return super._levantamentosFuture;
  }

  @override
  set _levantamentosFuture(ObservableFuture<List<Levantamento>> value) {
    _$_levantamentosFutureAtom.reportWrite(value, super._levantamentosFuture,
        () {
      super._levantamentosFuture = value;
    });
  }

  final _$_levantamentoFutureAtom =
      Atom(name: '_LevantamentoStore._levantamentoFuture');

  @override
  ObservableFuture<Levantamento> get _levantamentoFuture {
    _$_levantamentoFutureAtom.reportRead();
    return super._levantamentoFuture;
  }

  @override
  set _levantamentoFuture(ObservableFuture<Levantamento> value) {
    _$_levantamentoFutureAtom.reportWrite(value, super._levantamentoFuture, () {
      super._levantamentoFuture = value;
    });
  }

  final _$_levantamentoAtualizadoFutureAtom =
      Atom(name: '_LevantamentoStore._levantamentoAtualizadoFuture');

  @override
  ObservableFuture<Levantamento> get _levantamentoAtualizadoFuture {
    _$_levantamentoAtualizadoFutureAtom.reportRead();
    return super._levantamentoAtualizadoFuture;
  }

  @override
  set _levantamentoAtualizadoFuture(ObservableFuture<Levantamento> value) {
    _$_levantamentoAtualizadoFutureAtom
        .reportWrite(value, super._levantamentoAtualizadoFuture, () {
      super._levantamentoAtualizadoFuture = value;
    });
  }

  final _$verificaLevantamentosAsyncAction =
      AsyncAction('_LevantamentoStore.verificaLevantamentos');

  @override
  Future<dynamic> verificaLevantamentos(int idOrganizacao, bool deleteDB) {
    return _$verificaLevantamentosAsyncAction
        .run(() => super.verificaLevantamentos(idOrganizacao, deleteDB));
  }

  final _$verificaLevantamentoAsyncAction =
      AsyncAction('_LevantamentoStore.verificaLevantamento');

  @override
  Future<dynamic> verificaLevantamento() {
    return _$verificaLevantamentoAsyncAction
        .run(() => super.verificaLevantamento());
  }

  final _$buscaLevantamentoAsyncAction =
      AsyncAction('_LevantamentoStore.buscaLevantamento');

  @override
  Future<dynamic> buscaLevantamento(String codigo) {
    return _$buscaLevantamentoAsyncAction
        .run(() => super.buscaLevantamento(codigo));
  }

  final _$buscaLevantamentosAsyncAction =
      AsyncAction('_LevantamentoStore.buscaLevantamentos');

  @override
  Future<dynamic> buscaLevantamentos(int idOrganizacao, bool deleteDB) {
    return _$buscaLevantamentosAsyncAction
        .run(() => super.buscaLevantamentos(idOrganizacao, deleteDB));
  }

  final _$atualizaLevantamentosAsyncAction =
      AsyncAction('_LevantamentoStore.atualizaLevantamentos');

  @override
  Future<dynamic> atualizaLevantamentos(int id) {
    return _$atualizaLevantamentosAsyncAction
        .run(() => super.atualizaLevantamentos(id));
  }

  final _$buscaEstruturasInventarioAsyncAction =
      AsyncAction('_LevantamentoStore.buscaEstruturasInventario');

  @override
  Future<dynamic> buscaEstruturasInventario(
      List<Levantamento> listaLevantamento) {
    return _$buscaEstruturasInventarioAsyncAction
        .run(() => super.buscaEstruturasInventario(listaLevantamento));
  }

  @override
  String toString() {
    return '''
buscandoEstruturas: ${buscandoEstruturas},
atualizandoInv: ${atualizandoInv},
inventarioState: ${inventarioState},
levantamentosDados: ${levantamentosDados}
    ''';
  }
}
