import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/providers/index_providers.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'bem_patrimonial_store.g.dart';

class BemPatrimonialStore = _BemPatrimonialStore with _$BemPatrimonialStore;

enum BemPatrimonialState {
  inicial,
  carregando,
  carregado,
}

abstract class _BemPatrimonialStore with Store {
  final BensProvider _bensProvider;
  final EstruturaLevantamentoProvider _estruturaLevantamento;
  final InicializacaoProvider _inicializacao;
  final InventarioBensPatrimoniaisProvider _inventarioBemPatrimonial;

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
      throw (e);
    }
  }

  @action
  Future buscaBemPatrimonial(String numeroPatrimonial, String idInventario,
      int idUnidade, String idBem) async {
    buscandoBem = true;

    try {
      _bemPatrimonialFuture = ObservableFuture(
        _estruturaLevantamento
            .buscaBensPorId(numeroPatrimonial, idInventario, idUnidade, idBem)
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
      throw (e);
    }
  }

  @action
  Future buscaDominios() async {
    if (dominios.isEmpty) {
      try {
        _dominiosFuture = ObservableFuture(_inicializacao.getDominiosDB());
        dominios = await _dominiosFuture;
      } catch (e) {
        throw (e);
      }
    }
  }
}
