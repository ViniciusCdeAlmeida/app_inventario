import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/organizacoes.dart';

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

    existeDominio = await _inicializacao.getVerificaDominio2DB();

    existeBensPatrimoniais =
        await _inicializacao.getVerificaBensPatrimoniais2DB();

    try {
      if (!existeDominio) {
        print('Dominio busca web');

        _dominioFuture = ObservableFuture(
          _inicializacao
              .buscaDominioInicial2(conexao)
              .whenComplete(() => existeDominio = true)
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
      } else {
        print('Dominio busca banco');
      }
    } catch (e) {
      print(e);
    }
    try {
      if (!existeBensPatrimoniais) {
        print('BensPatrimoniais busca web');

        _bensPatrimoniaisFuture = ObservableFuture(
          _inicializacao.buscaBemPatrimonialInicial2(conexao).catchError(
            (error) {
              print(error);
            },
          ).whenComplete(() => existeBensPatrimoniais = true),
        ).catchError(
          (error) {
            print(error);
          },
        );
      } else {
        print('BensPatrimoniais busca banco');
      }
    } catch (e) {
      print(e);
    }
  }
}
