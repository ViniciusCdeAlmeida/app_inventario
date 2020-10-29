import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/inicializacao.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'bemPatrimonial_store.g.dart';

class BemPatrimonialStore = _BemPatrimonialStore with _$BemPatrimonialStore;

enum BemPatrimonialState {
  inicial,
  carregando,
  carregado,
}

abstract class _BemPatrimonialStore with Store {
  final BensProvider _bensProvider;
  final EstruturaLevantamento _estruturaLevantamento;
  final Inicializacao _inicializacao;
  final InventarioBensPatrimoniais _inventarioBemPatrimonial;

  _BemPatrimonialStore(this._bensProvider, this._estruturaLevantamento,
      this._inicializacao, this._inventarioBemPatrimonial);

  @observable
  List<Dominio> dominios = [];

  @observable
  BemPatrimonial bemPatrimonial;

  @observable
  bool buscandoBem = false;

  @observable
  List<DropdownMenuItem<Dominio>> _dominiosDropdown = [];

  @observable
  ObservableFuture _dominiosFuture;

  @observable
  ObservableFuture _bemPatrimonialFuture;

  @computed
  // ignore: missing_return
  BemPatrimonialState get bemPatrimonialState {
    if (_bemPatrimonialFuture == null ||
        _bemPatrimonialFuture.status == FutureStatus.rejected) {
      return BemPatrimonialState.inicial;
    }

    if (_bemPatrimonialFuture.status == FutureStatus.pending || buscandoBem)
      return BemPatrimonialState.carregando;

    if (dominios.isNotEmpty &&
        _bemPatrimonialFuture.status == FutureStatus.fulfilled)
      return BemPatrimonialState.carregado;
  }

  @action
  List<Dominio> filtroDominio(String chave) {
    return [...dominios.where((element) => element.chave == chave)];
  }

  @action
  List<DropdownMenuItem<Dominio>> filtroDominiosDropdownBens(String chave) {
    List<Dominio> dominioFiltrado = [
      ...dominios.where((element) => element.chave == chave)
    ];
    return dominioFiltrado.map(
      (itens) {
        return DropdownMenuItem(
          value: itens,
          child: Text(itens.descricao),
        );
      },
    ).toList();
  }

  @action
  Future saveBemInventariado(
      InventarioBemPatrimonial bemInventariado, int idBem) async {
    try {
      await _inventarioBemPatrimonial.gravaDados(bemInventariado);
      await _bensProvider.atualizaItemInventariado(idBem);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future buscaBemPatrimonial(String numeroPatrimonial) async {
    buscandoBem = true;

    try {
      _bemPatrimonialFuture = ObservableFuture(
        _estruturaLevantamento
            .buscaBensPorId(numeroPatrimonial)
            .whenComplete(() => buscandoBem = false)
            .catchError(
          (error) {
            throw error;
          },
        ),
      );
      bemPatrimonial = await _bemPatrimonialFuture;
    } catch (e) {
      buscandoBem = false;
      print(e);
    }
  }

  @action
  Future buscaDominios() async {
    if (dominios.isEmpty) {
      try {
        _dominiosFuture = ObservableFuture(
          _inicializacao.getDominiosDB().catchError(
            (error) {
              throw error;
            },
          ),
        );
        dominios = await _dominiosFuture;
      } catch (e) {
        print(e);
      }
    }
  }
}
