// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bens_inventariados_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BensInventariadoStore on _BensInventariadoStore, Store {
  Computed<BensInventariadoState> _$bensInventariadoStateComputed;

  @override
  BensInventariadoState get bensInventariadoState =>
      (_$bensInventariadoStateComputed ??= Computed<BensInventariadoState>(
              () => super.bensInventariadoState,
              name: '_BensInventariadoStore.bensInventariadoState'))
          .value;
  Computed<List<InventarioBemPatrimonial>> _$bensInventariadosComputed;

  @override
  List<InventarioBemPatrimonial> get bensInventariados =>
      (_$bensInventariadosComputed ??= Computed<List<InventarioBemPatrimonial>>(
              () => super.bensInventariados,
              name: '_BensInventariadoStore.bensInventariados'))
          .value;
  Computed<bool> _$existeBensParaEnviarComputed;

  @override
  bool get existeBensParaEnviar => (_$existeBensParaEnviarComputed ??=
          Computed<bool>(() => super.existeBensParaEnviar,
              name: '_BensInventariadoStore.existeBensParaEnviar'))
      .value;
  Computed<bool> _$enviandoBensComputed;

  @override
  bool get enviandoBens =>
      (_$enviandoBensComputed ??= Computed<bool>(() => super.enviandoBens,
              name: '_BensInventariadoStore.enviandoBens'))
          .value;

  final _$_bensInventariadosObservableAtom =
      Atom(name: '_BensInventariadoStore._bensInventariadosObservable');

  @override
  ObservableList<InventarioBemPatrimonial> get _bensInventariadosObservable {
    _$_bensInventariadosObservableAtom.reportRead();
    return super._bensInventariadosObservable;
  }

  @override
  set _bensInventariadosObservable(
      ObservableList<InventarioBemPatrimonial> value) {
    _$_bensInventariadosObservableAtom
        .reportWrite(value, super._bensInventariadosObservable, () {
      super._bensInventariadosObservable = value;
    });
  }

  final _$_bensInventariadosFutureAtom =
      Atom(name: '_BensInventariadoStore._bensInventariadosFuture');

  @override
  ObservableFuture<List<InventarioBemPatrimonial>>
      get _bensInventariadosFuture {
    _$_bensInventariadosFutureAtom.reportRead();
    return super._bensInventariadosFuture;
  }

  @override
  set _bensInventariadosFuture(
      ObservableFuture<List<InventarioBemPatrimonial>> value) {
    _$_bensInventariadosFutureAtom
        .reportWrite(value, super._bensInventariadosFuture, () {
      super._bensInventariadosFuture = value;
    });
  }

  final _$buscandoBensColetadosAtom =
      Atom(name: '_BensInventariadoStore.buscandoBensColetados');

  @override
  bool get buscandoBensColetados {
    _$buscandoBensColetadosAtom.reportRead();
    return super.buscandoBensColetados;
  }

  @override
  set buscandoBensColetados(bool value) {
    _$buscandoBensColetadosAtom.reportWrite(value, super.buscandoBensColetados,
        () {
      super.buscandoBensColetados = value;
    });
  }

  final _$_enviandoBensColetadosAtom =
      Atom(name: '_BensInventariadoStore._enviandoBensColetados');

  @override
  bool get _enviandoBensColetados {
    _$_enviandoBensColetadosAtom.reportRead();
    return super._enviandoBensColetados;
  }

  @override
  set _enviandoBensColetados(bool value) {
    _$_enviandoBensColetadosAtom
        .reportWrite(value, super._enviandoBensColetados, () {
      super._enviandoBensColetados = value;
    });
  }

  final _$buscaBensColetadosAsyncAction =
      AsyncAction('_BensInventariadoStore.buscaBensColetados');

  @override
  Future<dynamic> buscaBensColetados(int idUnidade) {
    return _$buscaBensColetadosAsyncAction
        .run(() => super.buscaBensColetados(idUnidade));
  }

  final _$enviaBensColetadosAsyncAction =
      AsyncAction('_BensInventariadoStore.enviaBensColetados');

  @override
  Future<dynamic> enviaBensColetados(int idUnidade) {
    return _$enviaBensColetadosAsyncAction
        .run(() => super.enviaBensColetados(idUnidade));
  }

  @override
  String toString() {
    return '''
buscandoBensColetados: ${buscandoBensColetados},
bensInventariadoState: ${bensInventariadoState},
bensInventariados: ${bensInventariados},
existeBensParaEnviar: ${existeBensParaEnviar},
enviandoBens: ${enviandoBens}
    ''';
  }
}
