// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estrutura_levantamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstruturaLevantamentoStore on _EstruturaLevantamentoStore, Store {
  Computed<EstruturasLevantamentoState> _$estruturasStateComputed;

  @override
  EstruturasLevantamentoState get estruturasState =>
      (_$estruturasStateComputed ??= Computed<EstruturasLevantamentoState>(
              () => super.estruturasState,
              name: '_EstruturaLevantamentoStore.estruturasState'))
          .value;
  Computed<List<EstruturaInventario>> _$estruturasComputed;

  @override
  List<EstruturaInventario> get estruturas => (_$estruturasComputed ??=
          Computed<List<EstruturaInventario>>(() => super.estruturas,
              name: '_EstruturaLevantamentoStore.estruturas'))
      .value;

  final _$buscandoEstruturasAtom =
      Atom(name: '_EstruturaLevantamentoStore.buscandoEstruturas');

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

  final _$_estruturasObservableAtom =
      Atom(name: '_EstruturaLevantamentoStore._estruturasObservable');

  @override
  List<EstruturaInventario> get _estruturasObservable {
    _$_estruturasObservableAtom.reportRead();
    return super._estruturasObservable;
  }

  @override
  set _estruturasObservable(List<EstruturaInventario> value) {
    _$_estruturasObservableAtom.reportWrite(value, super._estruturasObservable,
        () {
      super._estruturasObservable = value;
    });
  }

  final _$_estruturasFiltradoAtom =
      Atom(name: '_EstruturaLevantamentoStore._estruturasFiltrado');

  @override
  List<EstruturaInventario> get _estruturasFiltrado {
    _$_estruturasFiltradoAtom.reportRead();
    return super._estruturasFiltrado;
  }

  @override
  set _estruturasFiltrado(List<EstruturaInventario> value) {
    _$_estruturasFiltradoAtom.reportWrite(value, super._estruturasFiltrado, () {
      super._estruturasFiltrado = value;
    });
  }

  final _$_estruturasFutureAtom =
      Atom(name: '_EstruturaLevantamentoStore._estruturasFuture');

  @override
  ObservableFuture<List<EstruturaInventario>> get _estruturasFuture {
    _$_estruturasFutureAtom.reportRead();
    return super._estruturasFuture;
  }

  @override
  set _estruturasFuture(ObservableFuture<List<EstruturaInventario>> value) {
    _$_estruturasFutureAtom.reportWrite(value, super._estruturasFuture, () {
      super._estruturasFuture = value;
    });
  }

  final _$verificaInventariosAsyncAction =
      AsyncAction('_EstruturaLevantamentoStore.verificaInventarios');

  @override
  Future<dynamic> verificaInventarios(int idEstrutura) {
    return _$verificaInventariosAsyncAction
        .run(() => super.verificaInventarios(idEstrutura));
  }

  final _$_EstruturaLevantamentoStoreActionController =
      ActionController(name: '_EstruturaLevantamentoStore');

  @override
  void filtraBens(String value) {
    final _$actionInfo = _$_EstruturaLevantamentoStoreActionController
        .startAction(name: '_EstruturaLevantamentoStore.filtraBens');
    try {
      return super.filtraBens(value);
    } finally {
      _$_EstruturaLevantamentoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpaFiltrados() {
    final _$actionInfo = _$_EstruturaLevantamentoStoreActionController
        .startAction(name: '_EstruturaLevantamentoStore.limpaFiltrados');
    try {
      return super.limpaFiltrados();
    } finally {
      _$_EstruturaLevantamentoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buscandoEstruturas: ${buscandoEstruturas},
estruturasState: ${estruturasState},
estruturas: ${estruturas}
    ''';
  }
}
