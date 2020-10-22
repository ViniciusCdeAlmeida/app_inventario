import 'package:app_inventario/models/serialized/estruturaInventario.dart';
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
  List<Levantamento> levantamentos = [];

  @observable
  ObservableFuture<List<Levantamento>> _inventariosFuture;

  @computed
  // ignore: missing_return
  LevantamentosState get inventarioState {
    if (_inventariosFuture == null ||
        _inventariosFuture.status == FutureStatus.rejected) {
      return LevantamentosState.inicial;
    }

    if (_inventariosFuture.status == FutureStatus.pending || buscandoEstruturas)
      return LevantamentosState.carregando;

    if (existeInventario && levantamentos.isNotEmpty)
      return LevantamentosState.carregado;
  }

  @action
  Future verificaInventarios(String conexao, int idOrganizacao) async {
    existeInventario = await _levantamentos.getVerificaInventarios2DB();

    if (!existeInventario) {
      try {
        _inventariosFuture = ObservableFuture(
          _levantamentos
              .buscaLevantamento2(idOrganizacao, conexao)
              .whenComplete(() => existeInventario = true)
              .catchError(
            (error) {
              throw error;
            },
          ),
        ).catchError(
          (error) {
            print(error);
          },
        );
        levantamentos = await _inventariosFuture;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        _inventariosFuture =
            ObservableFuture(_levantamentos.getLevantamentos2DB(idOrganizacao));
        levantamentos = await _inventariosFuture;
      } catch (e) {
        print(e);
      }
    }
  }

  @action
  Future buscaEstruturasInventario(
      String conexao, List<Levantamento> listaLevantamento) async {
    buscandoEstruturas = true;
    try {
      await _estruturaLevantamento
          .buscaEstruturas2(conexao, listaLevantamento)
          .whenComplete(() => buscandoEstruturas = false)
          .catchError(
        (error) {
          throw error;
        },
      );
    } catch (e) {
      buscandoEstruturas = false;
      print(e);
    }
  }
}
