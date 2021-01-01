// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliver_app_bar_custom_classificacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SliverAppBarCustomClassificacaoStore
    on _SliverAppBarCustomClassificacaoStore, Store {
  Computed<String> _$tipoMenuComputed;

  @override
  String get tipoMenu =>
      (_$tipoMenuComputed ??= Computed<String>(() => super.tipoMenu,
              name: '_SliverAppBarCustomClassificacaoStore.tipoMenu'))
          .value;
  Computed<int> _$selecionadoComputed;

  @override
  int get selecionado =>
      (_$selecionadoComputed ??= Computed<int>(() => super.selecionado,
              name: '_SliverAppBarCustomClassificacaoStore.selecionado'))
          .value;

  final _$tipoOrdenacaoAtom =
      Atom(name: '_SliverAppBarCustomClassificacaoStore.tipoOrdenacao');

  @override
  String get tipoOrdenacao {
    _$tipoOrdenacaoAtom.reportRead();
    return super.tipoOrdenacao;
  }

  @override
  set tipoOrdenacao(String value) {
    _$tipoOrdenacaoAtom.reportWrite(value, super.tipoOrdenacao, () {
      super.tipoOrdenacao = value;
    });
  }

  final _$tipoSelecionadoAtom =
      Atom(name: '_SliverAppBarCustomClassificacaoStore.tipoSelecionado');

  @override
  int get tipoSelecionado {
    _$tipoSelecionadoAtom.reportRead();
    return super.tipoSelecionado;
  }

  @override
  set tipoSelecionado(int value) {
    _$tipoSelecionadoAtom.reportWrite(value, super.tipoSelecionado, () {
      super.tipoSelecionado = value;
    });
  }

  final _$_SliverAppBarCustomClassificacaoStoreActionController =
      ActionController(name: '_SliverAppBarCustomClassificacaoStore');

  @override
  void selecionadoMenu(int selecionado) {
    final _$actionInfo =
        _$_SliverAppBarCustomClassificacaoStoreActionController.startAction(
            name: '_SliverAppBarCustomClassificacaoStore.selecionadoMenu');
    try {
      return super.selecionadoMenu(selecionado);
    } finally {
      _$_SliverAppBarCustomClassificacaoStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void menuOrigem(String menu) {
    final _$actionInfo = _$_SliverAppBarCustomClassificacaoStoreActionController
        .startAction(name: '_SliverAppBarCustomClassificacaoStore.menuOrigem');
    try {
      return super.menuOrigem(menu);
    } finally {
      _$_SliverAppBarCustomClassificacaoStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void limpaOrdencao(int selecionado) {
    final _$actionInfo =
        _$_SliverAppBarCustomClassificacaoStoreActionController.startAction(
            name: '_SliverAppBarCustomClassificacaoStore.limpaOrdencao');
    try {
      return super.limpaOrdencao(selecionado);
    } finally {
      _$_SliverAppBarCustomClassificacaoStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoOrdenacao: ${tipoOrdenacao},
tipoSelecionado: ${tipoSelecionado},
tipoMenu: ${tipoMenu},
selecionado: ${selecionado}
    ''';
  }
}
