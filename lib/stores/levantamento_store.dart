import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:mobx/mobx.dart';

part 'levantamento_store.g.dart';

class LevantamentoStore = _LevantamentoStore with _$LevantamentoStore;

enum LevantamentosState {
  inicial,
  carregando,
  carregado,
  vazio,
}

abstract class _LevantamentoStore with Store {
  final Levantamentos _levantamentos;
  final EstruturaLevantamento _estruturaLevantamento;

  _LevantamentoStore(this._levantamentos, this._estruturaLevantamento);

  @observable
  bool existeInventario = false;

  @observable
  bool buscandoEstruturas = false;

  @observable
  bool atualizandoInv = false;

  @observable
  ObservableList<Levantamento> _levantamentosObservable =
      ObservableList<Levantamento>();

  @observable
  ObservableFuture<List<Levantamento>> _inventariosFuture;

  @observable
  ObservableFuture<Levantamento> _inventarioAtualizadoFuture;

  @computed
  // ignore: missing_return
  LevantamentosState get inventarioState {
    if (_inventariosFuture == null ||
        _inventariosFuture.status == FutureStatus.rejected) {
      return LevantamentosState.inicial;
    }

    if (_inventariosFuture.status == FutureStatus.pending || buscandoEstruturas)
      return LevantamentosState.carregando;

    if (_inventariosFuture.status == FutureStatus.fulfilled &&
        !buscandoEstruturas &&
        _levantamentosObservable.isEmpty &&
        !atualizandoInv) return LevantamentosState.vazio;

    if (existeInventario && _levantamentosObservable.isNotEmpty)
      return LevantamentosState.carregado;
  }

  @computed
  List<Levantamento> get levantamentosDados {
    return [..._levantamentosObservable];
  }

  @action
  Future verificaInventarios(String conexao, int idOrganizacao) async {
    existeInventario = await _levantamentos.getVerificaInventariosDB();

    if (!existeInventario) {
      try {
        _inventariosFuture = ObservableFuture(
          _levantamentos
              .buscaLevantamento(idOrganizacao, conexao)
              .whenComplete(() => existeInventario = true),
        );
        _levantamentosObservable = (await _inventariosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    } else {
      try {
        _inventariosFuture =
            ObservableFuture(_levantamentos.getLevantamentosDB(idOrganizacao));
        _levantamentosObservable = (await _inventariosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    }
  }

  @action
  Future atualizaInventarios(String conexao, int id) async {
    atualizandoInv = true;
    try {
      _inventarioAtualizadoFuture =
          ObservableFuture(_levantamentos.atualizaDadosInventario(id, conexao))
              // ignore: missing_return
              .then((value) {
        var item =
            _levantamentosObservable.indexWhere((element) => element.id == id);
        _levantamentosObservable.removeAt(item);
        _levantamentosObservable.insert(item, value);
        atualizandoInv = false;
      });
    } catch (e) {
      throw (e);
    }
  }

  @action
  Future buscaEstruturasInventario(
      String conexao, List<Levantamento> listaLevantamento) async {
    buscandoEstruturas = true;
    try {
      await _estruturaLevantamento
          .buscaEstruturas(conexao, listaLevantamento)
          .whenComplete(() => buscandoEstruturas = false);
    } catch (e) {
      buscandoEstruturas = false;
      throw (e);
    }
  }
}
