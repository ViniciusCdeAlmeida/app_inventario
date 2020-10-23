import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inicializacao.dart';

import 'package:mobx/mobx.dart';

part 'inicializacao_store.g.dart';

class InicializacaoStore = _InicializacaoStore with _$InicializacaoStore;

enum OrganizacoesState {
  initial,
  loading,
  loaded,
  empty,
}

enum InicializacaoState {
  inicial,
  carregandoDominio,
  carregandoBensPatrimonias,
  carregadoBensPatrimonias,
  carregadoDominio,
  carregadoInicializacao
}

abstract class _InicializacaoStore with Store {
  final Inicializacao _inicializacao;
  final Autenticacao _organizacoes;

  _InicializacaoStore(this._inicializacao, this._organizacoes);

  @observable
  bool existeDominio = false;

  @observable
  bool existeBensPatrimoniais = false;

  @observable
  ObservableFuture _organizacoesFuture;

  @observable
  ObservableFuture _dominioFuture;

  @observable
  ObservableFuture _bensPatrimoniaisFuture;

  @computed
  OrganizacoesState get organizacoesState {
    if (_organizacoesFuture == null ||
        _organizacoesFuture.status == FutureStatus.rejected) {
      return OrganizacoesState.initial;
    }

    return _organizacoesFuture.status == FutureStatus.pending
        ? OrganizacoesState.loading
        : OrganizacoesState.loaded;
  }

  @computed
  // ignore: missing_return
  InicializacaoState get inicializacaoState {
    if (existeDominio && existeBensPatrimoniais)
      return InicializacaoState.carregadoInicializacao;

    if ((_bensPatrimoniaisFuture == null ||
            _bensPatrimoniaisFuture.status == FutureStatus.rejected) &&
        (_dominioFuture == null ||
            _dominioFuture.status == FutureStatus.rejected)) {
      return InicializacaoState.inicial;
    }

    if (_dominioFuture.status == FutureStatus.pending)
      return InicializacaoState.carregandoDominio;

    if (_bensPatrimoniaisFuture.status == FutureStatus.pending)
      return InicializacaoState.carregandoBensPatrimonias;

    if (_dominioFuture.status == FutureStatus.fulfilled || existeDominio)
      return InicializacaoState.carregadoBensPatrimonias;

    if (_bensPatrimoniaisFuture.status == FutureStatus.fulfilled ||
        existeBensPatrimoniais)
      return InicializacaoState.carregadoBensPatrimonias;
  }

  @action
  Future verificaInicializacao(String conexao) async {
    await _organizacoes.getOrganizacoesDB();

    existeDominio = await _inicializacao.getVerificaDominioDB();

    existeBensPatrimoniais =
        await _inicializacao.getVerificaBensPatrimoniaisDB();

    try {
      if (!existeDominio) {
        _dominioFuture = ObservableFuture(_inicializacao
            .buscaDominioInicial(conexao)
            .whenComplete(() => existeDominio = true)).catchError(
          (error) {
            print(error);
          },
        );
      }
    } catch (e) {
      print(e);
    }
    try {
      if (!existeBensPatrimoniais) {
        _bensPatrimoniaisFuture = ObservableFuture(
          _inicializacao.buscaBemPatrimonialInicial(conexao).catchError(
            (error) {
              print(error);
            },
          ).whenComplete(() => existeBensPatrimoniais = true),
        ).catchError(
          (error) {
            print(error);
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
