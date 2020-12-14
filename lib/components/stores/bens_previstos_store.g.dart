// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bens_previstos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BensPrevistosStore on _BensPrevistosStore, Store {
  Computed<BensPrevistosState> _$estruturasStateComputed;

  @override
  BensPrevistosState get estruturasState => (_$estruturasStateComputed ??=
          Computed<BensPrevistosState>(() => super.estruturasState,
              name: '_BensPrevistosStore.estruturasState'))
      .value;
  Computed<List<DadosBensPatrimoniais>> _$dadosBemPatrimoniaisComputed;

  @override
  List<DadosBensPatrimoniais> get dadosBemPatrimoniais =>
      (_$dadosBemPatrimoniaisComputed ??= Computed<List<DadosBensPatrimoniais>>(
              () => super.dadosBemPatrimoniais,
              name: '_BensPrevistosStore.dadosBemPatrimoniais'))
          .value;

  final _$buscandoBensAtom = Atom(name: '_BensPrevistosStore.buscandoBens');

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
      Atom(name: '_BensPrevistosStore._dadosBensPatrimoniaisObservable');

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
      name: '_BensPrevistosStore._dadosBensPatrimoniaisFiltradoObservable');

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
      Atom(name: '_BensPrevistosStore._dadosBensPatrimoniaisFuture');

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

  final _$buscaBensPorEstruturaAsyncAction =
      AsyncAction('_BensPrevistosStore.buscaBensPorEstrutura');

  @override
  Future<dynamic> buscaBensPorEstrutura(
      int idUl, String idInventarioEstrutura) {
    return _$buscaBensPorEstruturaAsyncAction
        .run(() => super.buscaBensPorEstrutura(idUl, idInventarioEstrutura));
  }

  final _$_BensPrevistosStoreActionController =
      ActionController(name: '_BensPrevistosStore');

  @override
  void atualizaItem(int id) {
    final _$actionInfo = _$_BensPrevistosStoreActionController.startAction(
        name: '_BensPrevistosStore.atualizaItem');
    try {
      return super.atualizaItem(id);
    } finally {
      _$_BensPrevistosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filtraBens(String value) {
    final _$actionInfo = _$_BensPrevistosStoreActionController.startAction(
        name: '_BensPrevistosStore.filtraBens');
    try {
      return super.filtraBens(value);
    } finally {
      _$_BensPrevistosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpaFiltrados() {
    final _$actionInfo = _$_BensPrevistosStoreActionController.startAction(
        name: '_BensPrevistosStore.limpaFiltrados');
    try {
      return super.limpaFiltrados();
    } finally {
      _$_BensPrevistosStoreActionController.endAction(_$actionInfo);
    }
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
