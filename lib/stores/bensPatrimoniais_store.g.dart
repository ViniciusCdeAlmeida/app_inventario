// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bensPatrimoniais_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BensPatrimoniaisStore on _BensPatrimoniaisStore, Store {
  Computed<BensPrevistosState> _$estruturasStateComputed;

  @override
  BensPrevistosState get estruturasState => (_$estruturasStateComputed ??=
          Computed<BensPrevistosState>(() => super.estruturasState,
              name: '_BensPatrimoniaisStore.estruturasState'))
      .value;
  Computed<List<DadosBensPatrimoniais>> _$dadosBemPatrimoniaisComputed;

  @override
  List<DadosBensPatrimoniais> get dadosBemPatrimoniais =>
      (_$dadosBemPatrimoniaisComputed ??= Computed<List<DadosBensPatrimoniais>>(
              () => super.dadosBemPatrimoniais,
              name: '_BensPatrimoniaisStore.dadosBemPatrimoniais'))
          .value;

  final _$buscandoBensAtom = Atom(name: '_BensPatrimoniaisStore.buscandoBens');

  @override
  bool get buscandoBens {
    _$buscandoBensAtom.reportRead();
    return super.buscandoBens;
  }

  @override
  set buscandoBens(bool value) {
    _$buscandoBensAtom.reportWrite(value, super.buscandoBens, () {
      super.buscandoBens = value;
    });
  }

  final _$_dadosBensPatrimoniaisObservableAtom =
      Atom(name: '_BensPatrimoniaisStore._dadosBensPatrimoniaisObservable');

  @override
  ObservableList<DadosBensPatrimoniais> get _dadosBensPatrimoniaisObservable {
    _$_dadosBensPatrimoniaisObservableAtom.reportRead();
    return super._dadosBensPatrimoniaisObservable;
  }

  @override
  set _dadosBensPatrimoniaisObservable(
      ObservableList<DadosBensPatrimoniais> value) {
    _$_dadosBensPatrimoniaisObservableAtom
        .reportWrite(value, super._dadosBensPatrimoniaisObservable, () {
      super._dadosBensPatrimoniaisObservable = value;
    });
  }

  final _$_dadosBensPatrimoniaisFiltradoObservableAtom = Atom(
      name: '_BensPatrimoniaisStore._dadosBensPatrimoniaisFiltradoObservable');

  @override
  ObservableList<DadosBensPatrimoniais>
      get _dadosBensPatrimoniaisFiltradoObservable {
    _$_dadosBensPatrimoniaisFiltradoObservableAtom.reportRead();
    return super._dadosBensPatrimoniaisFiltradoObservable;
  }

  @override
  set _dadosBensPatrimoniaisFiltradoObservable(
      ObservableList<DadosBensPatrimoniais> value) {
    _$_dadosBensPatrimoniaisFiltradoObservableAtom
        .reportWrite(value, super._dadosBensPatrimoniaisFiltradoObservable, () {
      super._dadosBensPatrimoniaisFiltradoObservable = value;
    });
  }

  final _$_dadosBensPatrimoniaisFutureAtom =
      Atom(name: '_BensPatrimoniaisStore._dadosBensPatrimoniaisFuture');

  @override
  ObservableFuture<List<DadosBensPatrimoniais>>
      get _dadosBensPatrimoniaisFuture {
    _$_dadosBensPatrimoniaisFutureAtom.reportRead();
    return super._dadosBensPatrimoniaisFuture;
  }

  @override
  set _dadosBensPatrimoniaisFuture(
      ObservableFuture<List<DadosBensPatrimoniais>> value) {
    _$_dadosBensPatrimoniaisFutureAtom
        .reportWrite(value, super._dadosBensPatrimoniaisFuture, () {
      super._dadosBensPatrimoniaisFuture = value;
    });
  }

  final _$atualizaItemAsyncAction =
      AsyncAction('_BensPatrimoniaisStore.atualizaItem');

  @override
  Future<dynamic> atualizaItem(int id) {
    return _$atualizaItemAsyncAction.run(() => super.atualizaItem(id));
  }

  final _$filtraBensAsyncAction =
      AsyncAction('_BensPatrimoniaisStore.filtraBens');

  @override
  Future<dynamic> filtraBens(String value) {
    return _$filtraBensAsyncAction.run(() => super.filtraBens(value));
  }

  final _$limpaFiltradosAsyncAction =
      AsyncAction('_BensPatrimoniaisStore.limpaFiltrados');

  @override
  Future<dynamic> limpaFiltrados() {
    return _$limpaFiltradosAsyncAction.run(() => super.limpaFiltrados());
  }

  final _$buscaBensPorEstruturaAsyncAction =
      AsyncAction('_BensPatrimoniaisStore.buscaBensPorEstrutura');

  @override
  Future<dynamic> buscaBensPorEstrutura(int id, String idInventarioEstrutura) {
    return _$buscaBensPorEstruturaAsyncAction
        .run(() => super.buscaBensPorEstrutura(id, idInventarioEstrutura));
  }

  @override
  String toString() {
    return '''
buscandoBens: ${buscandoBens},
estruturasState: ${estruturasState},
dadosBemPatrimoniais: ${dadosBemPatrimoniais}
    ''';
  }
}
