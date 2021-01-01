import 'package:GRPInventario/utils/index_utils.dart';
import 'package:mobx/mobx.dart';

part 'sliver_app_bar_custom_classificacao_store.g.dart';

class SliverAppBarCustomClassificacaoStore = _SliverAppBarCustomClassificacaoStore
    with _$SliverAppBarCustomClassificacaoStore;

abstract class _SliverAppBarCustomClassificacaoStore with Store {
  _SliverAppBarCustomClassificacaoStore();

  final List<Map<String, String>> menuEstrutura = [
    {'nome': 'Tratada', 'tipo': '1'},
    {'nome': 'Não tratada', 'tipo': '2'},
    {'nome': 'Todos', 'tipo': '3'},
  ];

  final List<Map<String, String>> menuBensPrevistos = [
    {'nome': 'Inventariados', 'tipo': '1'},
    {'nome': 'Não inventariados', 'tipo': '2'},
    {'nome': 'Todos', 'tipo': '3'},
  ];

  @observable
  String tipoOrdenacao;

  @observable
  int tipoSelecionado = Dominios.ordenacaoTodos;

  String _menuAtual;

  // ignore: missing_return
  List<Map<String, String>> get dadosOrdenacao {
    switch (tipoOrdenacao) {
      case Dominios.menuEstruturaOrdenacao:
        if (_menuAtual != Dominios.menuEstruturaOrdenacao) {
          tipoSelecionado = Dominios.ordenacaoTodos;
          _menuAtual = tipoOrdenacao;
        }
        return menuEstrutura;
        break;
      case Dominios.menuBensPrevistosOrdenacao:
        if (_menuAtual != Dominios.menuBensPrevistosOrdenacao) {
          tipoSelecionado = Dominios.ordenacaoTodos;
          _menuAtual = tipoOrdenacao;
        }
        return menuBensPrevistos;
        break;
    }
  }

  @computed
  String get tipoMenu {
    return tipoOrdenacao;
  }

  @computed
  int get selecionado {
    return tipoSelecionado;
  }

  @action
  void selecionadoMenu(int selecionado) {
    tipoSelecionado = selecionado;
  }

  @action
  void menuOrigem(String menu) {
    tipoOrdenacao = menu;
  }

  @action
  void limpaOrdencao(int selecionado) {
    tipoSelecionado = selecionado;
  }

  void atualMenu(String menu) {
    tipoOrdenacao = menu;
  }
}
