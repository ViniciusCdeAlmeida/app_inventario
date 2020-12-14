// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InventarioStore on _InventarioStore, Store {
  Computed<InventarioState> _$inventarioStateComputed;

  @override
  InventarioState get inventarioState => (_$inventarioStateComputed ??=
          Computed<InventarioState>(() => super.inventarioState,
              name: '_InventarioStore.inventarioState'))
      .value;
  Computed<List<Inventario>> _$inventariosDadosComputed;

  @override
  List<Inventario> get inventariosDados => (_$inventariosDadosComputed ??=
          Computed<List<Inventario>>(() => super.inventariosDados,
              name: '_InventarioStore.inventariosDados'))
      .value;

  final _$_existeInventarioAtom =
      Atom(name: '_InventarioStore._existeInventario');

  @override
  bool get _existeInventario {
    _$_existeInventarioAtom.reportRead();
    return super._existeInventario;
  }

  @override
  set _existeInventario(bool value) {
    _$_existeInventarioAtom.reportWrite(value, super._existeInventario, () {
      super._existeInventario = value;
    });
  }

  final _$tipoInventarioAtom = Atom(name: '_InventarioStore.tipoInventario');

  @override
  bool get tipoInventario {
    _$tipoInventarioAtom.reportRead();
    return super.tipoInventario;
  }

  @override
  set tipoInventario(bool value) {
    _$tipoInventarioAtom.reportWrite(value, super.tipoInventario, () {
      super.tipoInventario = value;
    });
  }

  final _$buscandoEstruturasAtom =
      Atom(name: '_InventarioStore.buscandoEstruturas');

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

  final _$atualizandoInvAtom = Atom(name: '_InventarioStore.atualizandoInv');

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

  final _$_inventarioObservableAtom =
      Atom(name: '_InventarioStore._inventarioObservable');

  @override
  Inventario get _inventarioObservable {
    _$_inventarioObservableAtom.reportRead();
    return super._inventarioObservable;
  }

  @override
  set _inventarioObservable(Inventario value) {
    _$_inventarioObservableAtom.reportWrite(value, super._inventarioObservable,
        () {
      super._inventarioObservable = value;
    });
  }

  final _$_inventariosObservableAtom =
      Atom(name: '_InventarioStore._inventariosObservable');

  @override
  ObservableList<Inventario> get _inventariosObservable {
    _$_inventariosObservableAtom.reportRead();
    return super._inventariosObservable;
  }

  @override
  set _inventariosObservable(ObservableList<Inventario> value) {
    _$_inventariosObservableAtom
        .reportWrite(value, super._inventariosObservable, () {
      super._inventariosObservable = value;
    });
  }

  final _$_inventariosFutureAtom =
      Atom(name: '_InventarioStore._inventariosFuture');

  @override
  ObservableFuture<List<Inventario>> get _inventariosFuture {
    _$_inventariosFutureAtom.reportRead();
    return super._inventariosFuture;
  }

  @override
  set _inventariosFuture(ObservableFuture<List<Inventario>> value) {
    _$_inventariosFutureAtom.reportWrite(value, super._inventariosFuture, () {
      super._inventariosFuture = value;
    });
  }

  final _$_inventarioFutureAtom =
      Atom(name: '_InventarioStore._inventarioFuture');

  @override
  ObservableFuture<Inventario> get _inventarioFuture {
    _$_inventarioFutureAtom.reportRead();
    return super._inventarioFuture;
  }

  @override
  set _inventarioFuture(ObservableFuture<Inventario> value) {
    _$_inventarioFutureAtom.reportWrite(value, super._inventarioFuture, () {
      super._inventarioFuture = value;
    });
  }

  final _$_inventarioAtualizadoFutureAtom =
      Atom(name: '_InventarioStore._inventarioAtualizadoFuture');

  @override
  ObservableFuture<Inventario> get _inventarioAtualizadoFuture {
    _$_inventarioAtualizadoFutureAtom.reportRead();
    return super._inventarioAtualizadoFuture;
  }

  @override
  set _inventarioAtualizadoFuture(ObservableFuture<Inventario> value) {
    _$_inventarioAtualizadoFutureAtom
        .reportWrite(value, super._inventarioAtualizadoFuture, () {
      super._inventarioAtualizadoFuture = value;
    });
  }

  final _$verificaInventariosAsyncAction =
      AsyncAction('_InventarioStore.verificaInventarios');

  @override
  Future<dynamic> verificaInventarios(int idOrganizacao, bool deleteDB) {
    return _$verificaInventariosAsyncAction
        .run(() => super.verificaInventarios(idOrganizacao, deleteDB));
  }

  final _$verificaInventarioAsyncAction =
      AsyncAction('_InventarioStore.verificaInventario');

  @override
  Future<dynamic> verificaInventario() {
    return _$verificaInventarioAsyncAction
        .run(() => super.verificaInventario());
  }

  final _$buscaInventarioAsyncAction =
      AsyncAction('_InventarioStore.buscaInventario');

  @override
  Future<dynamic> buscaInventario(String codigo) {
    return _$buscaInventarioAsyncAction
        .run(() => super.buscaInventario(codigo));
  }

  final _$buscaInventariosAsyncAction =
      AsyncAction('_InventarioStore.buscaInventarios');

  @override
  Future<dynamic> buscaInventarios(int idOrganizacao, bool deleteDB) {
    return _$buscaInventariosAsyncAction
        .run(() => super.buscaInventarios(idOrganizacao, deleteDB));
  }

  final _$atualizaInventariosAsyncAction =
      AsyncAction('_InventarioStore.atualizaInventarios');

  @override
  Future<dynamic> atualizaInventarios(int id) {
    return _$atualizaInventariosAsyncAction
        .run(() => super.atualizaInventarios(id));
  }

  final _$buscaEstruturasInventariosAsyncAction =
      AsyncAction('_InventarioStore.buscaEstruturasInventarios');

  @override
  Future<dynamic> buscaEstruturasInventarios(List<Inventario> listaInventario) {
    return _$buscaEstruturasInventariosAsyncAction
        .run(() => super.buscaEstruturasInventarios(listaInventario));
  }

  @override
  String toString() {
    return '''
tipoInventario: ${tipoInventario},
buscandoEstruturas: ${buscandoEstruturas},
atualizandoInv: ${atualizandoInv},
inventarioState: ${inventarioState},
inventariosDados: ${inventariosDados}
    ''';
  }
}
