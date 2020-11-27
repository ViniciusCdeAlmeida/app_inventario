import 'package:GRPInventario/models/serialized/estruturaInventario.dart';
import 'package:GRPInventario/providers/estruturaLevantamento.dart';
import 'package:mobx/mobx.dart';

part 'estruturaLevantamento_store.g.dart';

class EstruturaLevantamentoStore = _EstruturaLevantamentoStore
    with _$EstruturaLevantamentoStore;

enum EstruturasLevantamentoState {
  inicial,
  carregando,
  carregado,
  vazio,
}

abstract class _EstruturaLevantamentoStore with Store {
  final EstruturaLevantamento _estruturaLevantamento;

  _EstruturaLevantamentoStore(this._estruturaLevantamento);

  @observable
  bool buscandoEstruturas = false;

  @observable
  List<EstruturaInventario> _estruturasObservable = [];

  @observable
  List<EstruturaInventario> _estruturasFiltrado = [];

  @observable
  ObservableFuture<List<EstruturaInventario>> _estruturasFuture;

  @computed
  // ignore: missing_return
  EstruturasLevantamentoState get estruturasState {
    if (_estruturasFuture == null ||
        _estruturasFuture.status == FutureStatus.rejected) {
      return EstruturasLevantamentoState.inicial;
    }

    if (_estruturasFuture.status == FutureStatus.pending || buscandoEstruturas)
      return EstruturasLevantamentoState.carregando;

    if (_estruturasFuture.status == FutureStatus.fulfilled &&
        !buscandoEstruturas &&
        estruturas.isEmpty) return EstruturasLevantamentoState.vazio;

    if (estruturas.isNotEmpty &&
        _estruturasFuture.status == FutureStatus.fulfilled)
      return EstruturasLevantamentoState.carregado;
  }

  @computed
  List<EstruturaInventario> get estruturas {
    return _estruturasFiltrado.isNotEmpty &&
            _estruturasFiltrado.length < [..._estruturasObservable].length
        ? _estruturasFiltrado
        : [..._estruturasObservable];
  }

  @action
  void filtraBens(String value) {
    _estruturasFiltrado = _estruturasObservable
        .where(
            // ignore: missing_return
            (element) {
          return element.estruturaOrganizacional.codigo
                  .contains(value.toUpperCase()) ||
              element.estruturaOrganizacional.nome
                  .contains(value.toUpperCase());
        })
        .toList()
        .asObservable();
  }

  @action
  void limpaFiltrados() {
    _estruturasFiltrado.clear();
  }

  @action
  Future verificaInventarios(int idEstrutura) async {
    buscandoEstruturas = true;
    try {
      _estruturasFuture = ObservableFuture(
        _estruturaLevantamento
            .buscaPorEstrutura(idEstrutura)
            .whenComplete(() => buscandoEstruturas = false),
      );
      _estruturasObservable = await _estruturasFuture;
    } catch (e) {
      buscandoEstruturas = false;
      throw (e);
    }
  }
}
