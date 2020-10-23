import 'package:app_inventario/models/serialized/estruturaInventario.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
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
  List<EstruturaInventario> estruturas = [];

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

  @action
  Future verificaInventarios(int idEstrutura) async {
    buscandoEstruturas = true;
    try {
      _estruturasFuture = ObservableFuture(
        _estruturaLevantamento
            .buscaPorEstrutura(idEstrutura)
            .whenComplete(() => buscandoEstruturas = false)
            .catchError(
          (error) {
            throw error;
          },
        ),
      );
      estruturas = await _estruturasFuture;
    } catch (e) {
      buscandoEstruturas = false;
      print(e);
    }
  }
}
