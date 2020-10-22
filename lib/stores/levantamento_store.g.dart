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

  final _$levantamentosAtom = Atom(name: '_LevantamentoStore.levantamentos');

  @override
  List<Levantamento> get levantamentos {
    _$levantamentosAtom.reportRead();
    return super.levantamentos;
  }

  @override
  set levantamentos(List<Levantamento> value) {
    _$levantamentosAtom.reportWrite(value, super.levantamentos, () {
      super.levantamentos = value;
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

  final _$verificaInventariosAsyncAction =
      AsyncAction('_LevantamentoStore.verificaInventarios');

  @override
  Future<dynamic> verificaInventarios(String conexao, int idOrganizacao) {
    return _$verificaInventariosAsyncAction
        .run(() => super.verificaInventarios(conexao, idOrganizacao));
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
levantamentos: ${levantamentos},
inventarioState: ${inventarioState}
    ''';
  }
}
