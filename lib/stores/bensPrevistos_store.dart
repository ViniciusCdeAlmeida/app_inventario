import 'package:GRPInventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:GRPInventario/providers/bensProvider.dart';
import 'package:mobx/mobx.dart';

part 'bensPrevistos_store.g.dart';

class BensPrevistosStore = _BensPrevistosStore with _$BensPrevistosStore;

enum BensPrevistosState {
  inicial,
  carregando,
  carregado,
  vazio,
}

abstract class _BensPrevistosStore with Store {
  final BensProvider _bensProvider;

  _BensPrevistosStore(this._bensProvider);

  @observable
  bool buscandoBens = false;

  @observable
  ObservableList<DadosBensPatrimoniais> _dadosBensPatrimoniaisObservable =
      ObservableList<DadosBensPatrimoniais>();

  @observable
  ObservableList<DadosBensPatrimoniais>
      _dadosBensPatrimoniaisFiltradoObservable =
      ObservableList<DadosBensPatrimoniais>();

  @observable
  ObservableFuture<List<DadosBensPatrimoniais>> _dadosBensPatrimoniaisFuture;

  @computed
  // ignore: missing_return
  BensPrevistosState get estruturasState {
    if (_dadosBensPatrimoniaisFuture == null ||
        _dadosBensPatrimoniaisFuture.status == FutureStatus.rejected) {
      return BensPrevistosState.inicial;
    }

    if (_dadosBensPatrimoniaisFuture.status == FutureStatus.pending ||
        buscandoBens) return BensPrevistosState.carregando;

    if (_dadosBensPatrimoniaisFuture.status == FutureStatus.fulfilled &&
        !buscandoBens &&
        _dadosBensPatrimoniaisObservable.isEmpty)
      return BensPrevistosState.vazio;

    if (_dadosBensPatrimoniaisObservable.isNotEmpty &&
        _dadosBensPatrimoniaisFuture.status == FutureStatus.fulfilled)
      return BensPrevistosState.carregado;
  }

  @computed
  List<DadosBensPatrimoniais> get dadosBemPatrimoniais {
    return _dadosBensPatrimoniaisFiltradoObservable.isNotEmpty &&
            _dadosBensPatrimoniaisFiltradoObservable.length <
                [..._dadosBensPatrimoniaisObservable].length
        ? _dadosBensPatrimoniaisFiltradoObservable
        : [..._dadosBensPatrimoniaisObservable];
  }

  @action
  void atualizaItem(int id) {
    if (_dadosBensPatrimoniaisFiltradoObservable.isNotEmpty) {
      final idx = _dadosBensPatrimoniaisFiltradoObservable
          .indexWhere((e) => e.idBemPatrimonial == id);
      if (idx >= 0) {
        var item = _dadosBensPatrimoniaisFiltradoObservable[idx];
        item.inventariado = true;
        _dadosBensPatrimoniaisFiltradoObservable.removeAt(idx);
        _dadosBensPatrimoniaisFiltradoObservable.insert(idx, item);
      }
    } else {
      final idx = _dadosBensPatrimoniaisObservable
          .indexWhere((e) => e.idBemPatrimonial == id);
      if (idx >= 0) {
        var item = _dadosBensPatrimoniaisObservable[idx];
        item.inventariado = true;
        _dadosBensPatrimoniaisObservable.removeAt(idx);
        _dadosBensPatrimoniaisObservable.insert(idx, item);
      }
    }
  }

  @action
  void filtraBens(String value) {
    _dadosBensPatrimoniaisFiltradoObservable = _dadosBensPatrimoniaisObservable
        .where(
          // ignore: missing_return
          (element) {
            if (element.numeroPatrimonial != null && element.material != null) {
              return element.numeroPatrimonial.contains(value.toUpperCase()) ||
                  element.material.descricao.contains(value.toUpperCase()) ||
                  element.material.codigoEDescricao
                      .contains(value.toUpperCase());
            } else if (element.numeroPatrimonial == null &&
                element.material != null) {
              return element.material.descricao.contains(value.toUpperCase()) ||
                  element.material.codigoEDescricao
                      .contains(value.toUpperCase()) ||
                  element.inventarioBemPatrimonial.numeroPatrimonial
                      .contains(value.toUpperCase());
            } else if (element.numeroPatrimonial != null &&
                element.material == null) {
              return element.numeroPatrimonial.contains(value.toUpperCase());
            } else if (element.numeroPatrimonial == null &&
                element.material != null) {
              return element.numeroPatrimonialCompleto
                  .contains(value.toUpperCase());
            }
          },
        )
        .toList()
        .asObservable();
  }

  @action
  void limpaFiltrados() {
    _dadosBensPatrimoniaisFiltradoObservable.clear();
  }

  @action
  Future buscaBensPorEstrutura(int idUl, String idInventarioEstrutura) async {
    buscandoBens = true;
    try {
      _dadosBensPatrimoniaisFuture = ObservableFuture(
        _bensProvider
            .buscaBensPorEstrutura(idUl, idInventarioEstrutura)
            .whenComplete(() => buscandoBens = false),
      );
      _dadosBensPatrimoniaisObservable =
          (await _dadosBensPatrimoniaisFuture).asObservable();
    } catch (e) {
      buscandoBens = false;
      throw (e);
    }
  }
}
