import 'package:app_inventario/models/serialized/organizacoes.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inicializacao.dart';

import 'package:mobx/mobx.dart';

part 'inicializacao_store.g.dart';

class InicializacaoStore = _InicializacaoStore with _$InicializacaoStore;

enum InicializacaoState {
  inicial,
  carregando,
  carregado,
  carregadoInicializacao,
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
  List<Organizacoes> organizacoes = [];

  @observable
  ObservableFuture _organizacoesFuture;

  @observable
  ObservableFuture _dominioFuture;

  @observable
  ObservableFuture _bensPatrimoniaisFuture;

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

    if ((_dominioFuture.status == FutureStatus.pending) ||
        (_bensPatrimoniaisFuture.status == FutureStatus.pending))
      return InicializacaoState.carregando;

    if ((_dominioFuture.status == FutureStatus.fulfilled || existeDominio) &&
            (_bensPatrimoniaisFuture.status == FutureStatus.fulfilled ||
                existeBensPatrimoniais) ||
        (existeDominio && existeBensPatrimoniais))
      return InicializacaoState.carregado;
  }

  @action
  Future _getBensPatrimoniais(String conexao) async {
    try {
      _bensPatrimoniaisFuture = ObservableFuture(
        _inicializacao.buscaBemPatrimonialInicial(conexao).catchError(
          (error) {
            print(error);
          },
        ).whenComplete(() => existeBensPatrimoniais = true),
      );
    } catch (e) {
      print(e);
    }
  }

  @action
  Future _getDominios(String conexao) async {
    try {
      _dominioFuture = ObservableFuture(
        _inicializacao
            .buscaDominioInicial(conexao)
            .whenComplete(() => existeDominio = true),
      );
    } catch (e) {
      print(e);
    }
  }

  @action
  Future verificaOrganizacoes() async {
    try {
      _organizacoesFuture = ObservableFuture(_organizacoes.getOrganizacoesDB());
      organizacoes = await _organizacoesFuture;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future verificaInicializacao(String conexao) async {
    existeDominio = await _inicializacao.getVerificaDominioDB();

    existeBensPatrimoniais =
        await _inicializacao.getVerificaBensPatrimoniaisDB();

    if (!existeDominio) {
      await _getDominios(conexao);
    }
    if (!existeBensPatrimoniais) {
      await _getBensPatrimoniais(conexao);
    }
  }
}
