import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/providers/index_providers.dart';
import 'package:mobx/mobx.dart';

part 'inventario_store.g.dart';

class InventarioStore = _InventarioStore with _$InventarioStore;

enum InventarioState {
  inicial,
  carregando,
  carregado,
  vazio,
}

abstract class _InventarioStore with Store {
  final InventariosProvider _inventarios;
  final EstruturaLevantamentoProvider _estruturaLevantamento;

  _InventarioStore(this._inventarios, this._estruturaLevantamento);

  @observable
  bool _existeInventario = false;

  @observable
  bool tipoInventario = true;

  @observable
  bool buscandoEstruturas = false;

  @observable
  bool atualizandoInv = false;

  @observable
  Inventario _inventarioObservable;

  @observable
  ObservableList<Inventario> _inventariosObservable =
      ObservableList<Inventario>();

  @observable
  ObservableFuture<List<Inventario>> _inventariosFuture;

  @observable
  ObservableFuture<Inventario> _inventarioFuture;

  @observable
  ObservableFuture<Inventario> _inventarioAtualizadoFuture;

  @computed
  // ignore: missing_return
  InventarioState get inventarioState {
    if (_inventariosFuture == null ||
        _inventariosFuture.status == FutureStatus.rejected) {
      return InventarioState.inicial;
    }
    if (_inventariosObservable.isEmpty &&
        _inventariosFuture.status == FutureStatus.fulfilled)
      return InventarioState.vazio;

    if ((_inventariosFuture.status == FutureStatus.pending ||
            (_inventarioFuture != null &&
                _inventarioFuture.status == FutureStatus.pending)) ||
        buscandoEstruturas) return InventarioState.carregando;

    if (_existeInventario &&
        _inventariosObservable.isNotEmpty &&
        _inventariosFuture.status == FutureStatus.fulfilled)
      return InventarioState.carregado;
  }

  @computed
  List<Inventario> get inventariosDados {
    return [..._inventariosObservable];
  }

  @action
  Future verificaInventarios(int idOrganizacao, bool deleteDB) async {
    if (deleteDB) {
      _inventarios.deleteInventario();
      _inventariosFuture =
          ObservableFuture(_inventarios.getInventariosDB(idOrganizacao));
      _inventariosObservable = (await _inventariosFuture).asObservable();
    }
    _existeInventario = await _inventarios.getVerificaInventariosDB();

    if (!_existeInventario) {
      try {
        _inventariosFuture = ObservableFuture(
          _inventarios
              .buscaInventarios(idOrganizacao)
              .whenComplete(() => _existeInventario = true),
        );
        _inventariosObservable = (await _inventariosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    } else {
      try {
        _inventariosFuture =
            ObservableFuture(_inventarios.getInventariosDB(idOrganizacao));
        _inventariosObservable = (await _inventariosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    }
  }

  @action
  Future verificaInventario() async {
    _existeInventario = await _inventarios.getVerificaInventariosDB();
    if (_existeInventario) _inventariosObservable.asObservable();
  }

  @action
  Future buscaInventario(String codigo) async {
    try {
      _inventarioFuture = ObservableFuture(
        _inventarios.buscaInventario(codigo),
      );
      _inventarioObservable = await _inventarioFuture;

      if (_inventarioObservable != null) {
        _inventariosObservable.add(_inventarioObservable);
        _inventarioObservable = null;
      }
    } catch (e) {
      throw (e);
    }
  }

  Future verificaTipoInventario(int idInventario) async =>
      //TRUE = LEVANTAMENTO
      //FALSE != LEVANTAMENTO
      tipoInventario = await _inventarios.verificaTipoInventario(idInventario);

  @action
  Future buscaInventarios(int idOrganizacao, bool deleteDB) async {
    try {
      _inventariosFuture = ObservableFuture(
        _inventarios
            .buscaInventarios(idOrganizacao)
            .whenComplete(() => _existeInventario = true),
      );
      _inventariosObservable = (await _inventariosFuture).asObservable();
    } catch (e) {
      throw (e);
    }
  }

  @action
  Future atualizaInventarios(int id) async {
    atualizandoInv = true;
    try {
      _inventarioAtualizadoFuture =
          ObservableFuture(_inventarios.atualizaDadosInventario(id))
              // ignore: missing_return
              .then((value) {
        var item =
            _inventariosObservable.indexWhere((element) => element.id == id);
        _inventariosObservable.removeAt(item);
        _inventariosObservable.insert(item, value);
        atualizandoInv = false;
      });
    } catch (e) {
      throw (e);
    }
  }

  @action
  Future buscaEstruturasInventarios(List<Inventario> listaInventario) async {
    buscandoEstruturas = true;
    try {
      await _estruturaLevantamento
          .buscaEstruturas(listaInventario)
          .whenComplete(() => buscandoEstruturas = false);
    } catch (e) {
      buscandoEstruturas = false;
      throw (e);
    }
  }
}
