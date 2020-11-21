import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:mobx/mobx.dart';

part 'bensInventariados_store.g.dart';

class BensInventariadoStore = _BensInventariadoStore
    with _$BensInventariadoStore;

enum BensInventariadoState {
  inicial,
  carregando,
  carregado,
}

abstract class _BensInventariadoStore with Store {
  final InventarioBensPatrimoniais _inventarioBemPatrimonial;

  _BensInventariadoStore(this._inventarioBemPatrimonial);

  @observable
  ObservableList<InventarioBemPatrimonial> _bensInventariadosObservable =
      ObservableList<InventarioBemPatrimonial>();

  @observable
  ObservableFuture<List<InventarioBemPatrimonial>> _bensInventariadosFuture;

  @observable
  bool buscandoBensColetados = false;

  @observable
  bool enviandoBensColetados = false;

  @computed
  // ignore: missing_return
  BensInventariadoState get bensInventariadoState {
    if (!enviandoBensColetados) {
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
    return enviandoBensColetados;
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
      enviandoBensColetados = true;
      try {
        ObservableFuture(
          Future.delayed(Duration(seconds: 2)).then(
            (_) {
              _inventarioBemPatrimonial.enviaDados(_listaEnviar).whenComplete(
                    () => {
                      enviandoBensColetados = false,
                      buscaBensColetados(idUnidade),
                    },
                  );
            },
          ),
        );
      } catch (e) {
        enviandoBensColetados = false;
        throw (e);
      }
    }
  }
}
