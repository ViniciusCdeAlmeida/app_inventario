// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bemPatrimonial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BemPatrimonialStore on _BemPatrimonialStore, Store {
  Computed<BemPatrimonialState> _$bemPatrimonialStateComputed;

  @override
  BemPatrimonialState get bemPatrimonialState =>
      (_$bemPatrimonialStateComputed ??= Computed<BemPatrimonialState>(
              () => super.bemPatrimonialState,
              name: '_BemPatrimonialStore.bemPatrimonialState'))
          .value;

  final _$dominiosAtom = Atom(name: '_BemPatrimonialStore.dominios');

  @override
  List<Dominio> get dominios {
    _$dominiosAtom.reportRead();
    return super.dominios;
  }

  @override
  set dominios(List<Dominio> value) {
    _$dominiosAtom.reportWrite(value, super.dominios, () {
      super.dominios = value;
    });
  }

  final _$bemPatrimonialAtom =
      Atom(name: '_BemPatrimonialStore.bemPatrimonial');

  @override
  BemPatrimonial get bemPatrimonial {
    _$bemPatrimonialAtom.reportRead();
    return super.bemPatrimonial;
  }

  @override
  set bemPatrimonial(BemPatrimonial value) {
    _$bemPatrimonialAtom.reportWrite(value, super.bemPatrimonial, () {
      super.bemPatrimonial = value;
    });
  }

  final _$buscandoBemAtom = Atom(name: '_BemPatrimonialStore.buscandoBem');

  @override
  bool get buscandoBem {
    _$buscandoBemAtom.reportRead();
    return super.buscandoBem;
  }

  @override
  set buscandoBem(bool value) {
    _$buscandoBemAtom.reportWrite(value, super.buscandoBem, () {
      super.buscandoBem = value;
    });
  }

  final _$_dominiosDropdownAtom =
      Atom(name: '_BemPatrimonialStore._dominiosDropdown');

  @override
  List<DropdownMenuItem<Dominio>> get _dominiosDropdown {
    _$_dominiosDropdownAtom.reportRead();
    return super._dominiosDropdown;
  }

  @override
  set _dominiosDropdown(List<DropdownMenuItem<Dominio>> value) {
    _$_dominiosDropdownAtom.reportWrite(value, super._dominiosDropdown, () {
      super._dominiosDropdown = value;
    });
  }

  final _$_dominiosFutureAtom =
      Atom(name: '_BemPatrimonialStore._dominiosFuture');

  @override
  ObservableFuture<dynamic> get _dominiosFuture {
    _$_dominiosFutureAtom.reportRead();
    return super._dominiosFuture;
  }

  @override
  set _dominiosFuture(ObservableFuture<dynamic> value) {
    _$_dominiosFutureAtom.reportWrite(value, super._dominiosFuture, () {
      super._dominiosFuture = value;
    });
  }

  final _$_bemPatrimonialFutureAtom =
      Atom(name: '_BemPatrimonialStore._bemPatrimonialFuture');

  @override
  ObservableFuture<dynamic> get _bemPatrimonialFuture {
    _$_bemPatrimonialFutureAtom.reportRead();
    return super._bemPatrimonialFuture;
  }

  @override
  set _bemPatrimonialFuture(ObservableFuture<dynamic> value) {
    _$_bemPatrimonialFutureAtom.reportWrite(value, super._bemPatrimonialFuture,
        () {
      super._bemPatrimonialFuture = value;
    });
  }

  final _$digitoVerificadorAtom =
      Atom(name: '_BemPatrimonialStore.digitoVerificador');

  @override
  String get digitoVerificador {
    _$digitoVerificadorAtom.reportRead();
    return super.digitoVerificador;
  }

  @override
  set digitoVerificador(String value) {
    _$digitoVerificadorAtom.reportWrite(value, super.digitoVerificador, () {
      super.digitoVerificador = value;
    });
  }

  final _$usuarioColetanteAtom =
      Atom(name: '_BemPatrimonialStore.usuarioColetante');

  @override
  String get usuarioColetante {
    _$usuarioColetanteAtom.reportRead();
    return super.usuarioColetante;
  }

  @override
  set usuarioColetante(String value) {
    _$usuarioColetanteAtom.reportWrite(value, super.usuarioColetante, () {
      super.usuarioColetante = value;
    });
  }

  final _$idAtualUlAtom = Atom(name: '_BemPatrimonialStore.idAtualUl');

  @override
  int get idAtualUl {
    _$idAtualUlAtom.reportRead();
    return super.idAtualUl;
  }

  @override
  set idAtualUl(int value) {
    _$idAtualUlAtom.reportWrite(value, super.idAtualUl, () {
      super.idAtualUl = value;
    });
  }

  final _$qtdeDigitosAtom = Atom(name: '_BemPatrimonialStore.qtdeDigitos');

  @override
  String get qtdeDigitos {
    _$qtdeDigitosAtom.reportRead();
    return super.qtdeDigitos;
  }

  @override
  set qtdeDigitos(String value) {
    _$qtdeDigitosAtom.reportWrite(value, super.qtdeDigitos, () {
      super.qtdeDigitos = value;
    });
  }

  final _$saveBemInventariadoAsyncAction =
      AsyncAction('_BemPatrimonialStore.saveBemInventariado');

  @override
  Future<dynamic> saveBemInventariado(
      InventarioBemPatrimonial bemInventariado, int idBem) {
    return _$saveBemInventariadoAsyncAction
        .run(() => super.saveBemInventariado(bemInventariado, idBem));
  }

  final _$buscaBemPatrimonialAsyncAction =
      AsyncAction('_BemPatrimonialStore.buscaBemPatrimonial');

  @override
  Future<dynamic> buscaBemPatrimonial(String numeroPatrimonial) {
    return _$buscaBemPatrimonialAsyncAction
        .run(() => super.buscaBemPatrimonial(numeroPatrimonial));
  }

  final _$buscaDominiosAsyncAction =
      AsyncAction('_BemPatrimonialStore.buscaDominios');

  @override
  Future<dynamic> buscaDominios() {
    return _$buscaDominiosAsyncAction.run(() => super.buscaDominios());
  }

  final _$_BemPatrimonialStoreActionController =
      ActionController(name: '_BemPatrimonialStore');

  @override
  List<Dominio> filtroDominio(String chave) {
    final _$actionInfo = _$_BemPatrimonialStoreActionController.startAction(
        name: '_BemPatrimonialStore.filtroDominio');
    try {
      return super.filtroDominio(chave);
    } finally {
      _$_BemPatrimonialStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<DropdownMenuItem<Dominio>> filtroDominiosDropdownBens(String chave) {
    final _$actionInfo = _$_BemPatrimonialStoreActionController.startAction(
        name: '_BemPatrimonialStore.filtroDominiosDropdownBens');
    try {
      return super.filtroDominiosDropdownBens(chave);
    } finally {
      _$_BemPatrimonialStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dominios: ${dominios},
bemPatrimonial: ${bemPatrimonial},
buscandoBem: ${buscandoBem},
digitoVerificador: ${digitoVerificador},
usuarioColetante: ${usuarioColetante},
idAtualUl: ${idAtualUl},
qtdeDigitos: ${qtdeDigitos},
bemPatrimonialState: ${bemPatrimonialState}
    ''';
  }
}
