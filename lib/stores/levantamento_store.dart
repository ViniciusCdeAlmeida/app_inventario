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
  // vazio,
}

abstract class _LevantamentoStore with Store {
  final Levantamentos _levantamentos;
  final EstruturaLevantamento _estruturaLevantamento;

  _LevantamentoStore(this._levantamentos, this._estruturaLevantamento);

  @observable
  bool _existeLevantamento = false;

  @observable
  bool buscandoEstruturas = false;

  @observable
  bool atualizandoInv = false;

  @observable
  Levantamento _levantamentoObservable;

  @observable
  ObservableList<Levantamento> _levantamentosObservable =
      ObservableList<Levantamento>();

  @observable
  ObservableFuture<List<Levantamento>> _levantamentosFuture;

  @observable
  ObservableFuture<Levantamento> _levantamentoFuture;

  @observable
  ObservableFuture<Levantamento> _levantamentoAtualizadoFuture;

  @computed
  // ignore: missing_return
  LevantamentosState get inventarioState {
    if (_levantamentosFuture == null ||
        _levantamentosFuture.status == FutureStatus.rejected) {
      return LevantamentosState.inicial;
    }
    // if (_levantamentosObservable.isEmpty ||
    //     _levantamentosFuture.status == FutureStatus.fulfilled &&
    //         !buscandoEstruturas &&
    //         _levantamentosObservable.isEmpty &&
    //         !atualizandoInv) return LevantamentosState.vazio;

    if ((_levantamentosFuture.status == FutureStatus.pending ||
            (_levantamentoFuture != null &&
                _levantamentoFuture.status == FutureStatus.pending)) ||
        buscandoEstruturas) return LevantamentosState.carregando;

    if (_existeLevantamento && _levantamentosObservable.isNotEmpty)
      return LevantamentosState.carregado;
  }

  @computed
  List<Levantamento> get levantamentosDados {
    return [..._levantamentosObservable];
  }

  @action
  Future verificaLevantamentos(int idOrganizacao, bool deleteDB) async {
    if (deleteDB) {
      _levantamentos.deleteLevantamento();
      _levantamentosFuture =
          ObservableFuture(_levantamentos.getLevantamentosDB(idOrganizacao));
      _levantamentosObservable = (await _levantamentosFuture).asObservable();
    }
    _existeLevantamento = await _levantamentos.getVerificaInventariosDB();

    if (!_existeLevantamento) {
      try {
        _levantamentosFuture = ObservableFuture(
          _levantamentos
              .buscaLevantamentos(idOrganizacao)
              .whenComplete(() => _existeLevantamento = true),
        );
        _levantamentosObservable = (await _levantamentosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    } else {
      try {
        _levantamentosFuture =
            ObservableFuture(_levantamentos.getLevantamentosDB(idOrganizacao));
        _levantamentosObservable = (await _levantamentosFuture).asObservable();
      } catch (e) {
        throw (e);
      }
    }
  }

  @action
  Future verificaLevantamento() async {
    _existeLevantamento = await _levantamentos.getVerificaInventariosDB();
    if (_existeLevantamento) _levantamentosObservable.asObservable();
  }

  @action
  Future buscaLevantamento(String codigo) async {
    try {
      _levantamentoFuture = ObservableFuture(
        _levantamentos.buscaLevantamento(codigo),
      );
      _levantamentoObservable = await _levantamentoFuture;

      if (_levantamentoObservable != null) {
        _levantamentosObservable.add(_levantamentoObservable);
        _levantamentoObservable = null;
      }
    } catch (e) {
      throw (e);
    }
  }

  @action
  Future buscaLevantamentos(int idOrganizacao, bool deleteDB) async {
    try {
      _levantamentosFuture = ObservableFuture(
        _levantamentos
            .buscaLevantamentos(idOrganizacao)
            .whenComplete(() => _existeLevantamento = true),
      );
      _levantamentosObservable = (await _levantamentosFuture).asObservable();
    } catch (e) {
      throw (e);
    }
  }

  @action
  Future atualizaLevantamentos(int id) async {
    atualizandoInv = true;
    try {
      _levantamentoAtualizadoFuture =
          ObservableFuture(_levantamentos.atualizaDadosInventario(id))
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
  Future buscaEstruturasInventario(List<Levantamento> listaLevantamento) async {
    buscandoEstruturas = true;
    try {
      await _estruturaLevantamento
          .buscaEstruturas(listaLevantamento)
          .whenComplete(() => buscandoEstruturas = false);
    } catch (e) {
      buscandoEstruturas = false;
      throw (e);
    }
  }
}
