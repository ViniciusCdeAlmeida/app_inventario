import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/providers/index_providers.dart';
import 'package:mobx/mobx.dart';

part 'bens_inventariados_store.g.dart';

class BensInventariadoStore = _BensInventariadoStore
    with _$BensInventariadoStore;

enum BensInventariadoState {
  inicial,
  carregando,
  carregado,
}

abstract class _BensInventariadoStore with Store {
  final InventarioBensPatrimoniaisProvider _inventarioBemPatrimonial;

  _BensInventariadoStore(this._inventarioBemPatrimonial);

  @observable
  ObservableList<InventarioBemPatrimonial> _bensInventariadosObservable =
      ObservableList<InventarioBemPatrimonial>();

  @observable
  ObservableFuture<List<InventarioBemPatrimonial>> _bensInventariadosFuture;

  @observable
  bool buscandoBensColetados = false;

  @observable
  bool _enviandoBensColetados = false;

  @computed
  // ignore: missing_return
  BensInventariadoState get bensInventariadoState {
    if (!_enviandoBensColetados) {
      return BensInventariadoState.carregado;
    }

    if (_bensInventariadosFuture == null ||
        _bensInventariadosFuture.status == FutureStatus.rejected) {
      return BensInventariadoState.inicial;
    }

    if (_bensInventariadosFuture.status == FutureStatus.pending ||
        buscandoBensColetados) return BensInventariadoState.carregando;

    if (_bensInventariadosFuture.status == FutureStatus.fulfilled)
      return BensInventariadoState.carregado;
  }

  @computed
  List<InventarioBemPatrimonial> get bensInventariados {
    return _bensInventariadosObservable;
  }

  @computed
  bool get existeBensParaEnviar {
    return _bensInventariadosObservable
        .where((element) => element.enviado == false)
        .toList()
        .isNotEmpty;
  }

  @computed
  bool get enviandoBens {
    return _enviandoBensColetados;
  }

  @action
  Future buscaBensColetados(int idUnidade) async {
    buscandoBensColetados = true;

    try {
      _bensInventariadosFuture = ObservableFuture(_inventarioBemPatrimonial
          .buscaBensInventariados(idUnidade)
          .whenComplete(() => buscandoBensColetados = false));
      _bensInventariadosObservable =
          (await _bensInventariadosFuture).asObservable();
    } catch (e) {
      buscandoBensColetados = false;
      throw (e);
    }
  }

  @action
  Future enviaBensColetados(int idUnidade) async {
    var _listaEnviar = _bensInventariadosObservable
        .where((element) => element.enviado == false)
        .toList();
    if (_listaEnviar.isNotEmpty) {
      _enviandoBensColetados = true;
      try {
        ObservableFuture(
          Future.delayed(Duration(seconds: 2)).then(
            (_) {
              _inventarioBemPatrimonial.enviaDados(_listaEnviar).whenComplete(
                    () => {
                      _enviandoBensColetados = false,
                      buscaBensColetados(idUnidade),
                    },
                  );
            },
          ),
        );
      } catch (e) {
        _enviandoBensColetados = false;
        throw (e);
      }
    }
  }
}
