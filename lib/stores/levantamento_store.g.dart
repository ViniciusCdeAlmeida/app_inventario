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

  final _$existeInventarioAtom =
      Atom(name: '_LevantamentoStore.existeInventario');

  @override
  bool get existeInventario {
    _$existeInventarioAtom.reportRead();
    return super.existeInventario;
  }

  @override
  set existeInventario(bool value) {
    _$existeInventarioAtom.reportWrite(value, super.existeInventario, () {
      super.existeInventario = value;
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

  final _$_inventariosFutureAtom =
      Atom(name: '_LevantamentoStore._inventariosFuture');

  @override
  ObservableFuture<List<Levantamento>> get _inventariosFuture {
    _$_inventariosFutureAtom.reportRead();
    return super._inventariosFuture;
  }

  @override
  set _inventariosFuture(ObservableFuture<List<Levantamento>> value) {
    _$_inventariosFutureAtom.reportWrite(value, super._inventariosFuture, () {
      super._inventariosFuture = value;
    });
  }

  final _$_inventarioAtualizadoFutureAtom =
      Atom(name: '_LevantamentoStore._inventarioAtualizadoFuture');

  @override
  ObservableFuture<Levantamento> get _inventarioAtualizadoFuture {
    _$_inventarioAtualizadoFutureAtom.reportRead();
    return super._inventarioAtualizadoFuture;
  }

  @override
  set _inventarioAtualizadoFuture(ObservableFuture<Levantamento> value) {
    _$_inventarioAtualizadoFutureAtom
        .reportWrite(value, super._inventarioAtualizadoFuture, () {
      super._inventarioAtualizadoFuture = value;
    });
  }

  final _$verificaInventariosAsyncAction =
      AsyncAction('_LevantamentoStore.verificaInventarios');

  @override
  Future<dynamic> verificaInventarios(String conexao, int idOrganizacao) {
    return _$verificaInventariosAsyncAction
        .run(() => super.verificaInventarios(conexao, idOrganizacao));
  }

  final _$atualizaInventariosAsyncAction =
      AsyncAction('_LevantamentoStore.atualizaInventarios');

  @override
  Future<dynamic> atualizaInventarios(String conexao, int id) {
    return _$atualizaInventariosAsyncAction
        .run(() => super.atualizaInventarios(conexao, id));
  }

  final _$buscaEstruturasInventarioAsyncAction =
      AsyncAction('_LevantamentoStore.buscaEstruturasInventario');

  @override
  Future<dynamic> buscaEstruturasInventario(
      String conexao, List<Levantamento> listaLevantamento) {
    return _$buscaEstruturasInventarioAsyncAction
        .run(() => super.buscaEstruturasInventario(conexao, listaLevantamento));
  }

  @override
  String toString() {
    return '''
existeInventario: ${existeInventario},
buscandoEstruturas: ${buscandoEstruturas},
atualizandoInv: ${atualizandoInv},
inventarioState: ${inventarioState},
levantamentosDados: ${levantamentosDados}
    ''';
  }
}
