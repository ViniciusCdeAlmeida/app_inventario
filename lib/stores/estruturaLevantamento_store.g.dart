// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estruturaLevantamento_store.dart';

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

  final _$estruturasAtom = Atom(name: '_EstruturaLevantamentoStore.estruturas');

  @override
  List<EstruturaInventario> get estruturas {
    _$estruturasAtom.reportRead();
    return super.estruturas;
  }

  @override
  set estruturas(List<EstruturaInventario> value) {
    _$estruturasAtom.reportWrite(value, super.estruturas, () {
      super.estruturas = value;
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

  @override
  String toString() {
    return '''
buscandoEstruturas: ${buscandoEstruturas},
estruturas: ${estruturas},
estruturasState: ${estruturasState}
    ''';
  }
}
