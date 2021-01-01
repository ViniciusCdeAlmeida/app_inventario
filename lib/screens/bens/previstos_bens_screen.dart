import 'package:GRPInventario/screens/bens/widgets/bens/previstos_bens_item.dart';
import 'package:GRPInventario/utils/dominios_utils.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/providers/index_providers.dart';
import 'package:GRPInventario/providers/stores/index_store.dart';

import 'package:GRPInventario/models/index_models.dart';

class PrevistosBensScreen extends StatefulWidget {
  static const routeName = '/bensPrevistosScreen';

  @override
  _PrevistosBensScreenState createState() => _PrevistosBensScreenState();
}

class _PrevistosBensScreenState extends State<PrevistosBensScreen> {
  ScreenArgumentos unidadeArgs;
  BensPrevistosStore _bensPrevistosStore;

  @override
  void didChangeDependencies() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;

    _bensPrevistosStore =
        Provider.of<BensPrevistosStore>(context, listen: false);
    _bensPrevistosStore.limpaFiltrados();
    _bensPrevistosStore.buscaBensPorEstrutura(unidadeArgs.id, unidadeArgs.arg1);
    Provider.of<EstruturaLevantamentoProvider>(context).ulAtual(unidadeArgs.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    _bensPrevistosStore =
        Provider.of<BensPrevistosStore>(context, listen: false);
    return Scaffold(
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_bensPrevistosStore.estruturasState) {
            case BensPrevistosState.inicial:
            case BensPrevistosState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case BensPrevistosState.vazio:
              return Center(
                child: Text('VAZIO'),
              );
            case BensPrevistosState.carregado:
              return CustomScrollView(
                slivers: [
                  SliverAppBarCustom(
                    titulo: unidadeArgs.arg2,
                    filtro: _bensPrevistosStore.filtraBens,
                    limpar: _bensPrevistosStore.limpaFiltrados,
                    ordenacao: _bensPrevistosStore.ordenaBens,
                    tipoMenu: Dominios.menuBensPrevistosOrdenacao,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _bensPrevistosStore.dadosBemPatrimoniais
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrevistosBensItem(
                                bemInventario: item,
                                idInventarioEstrutura: unidadeArgs.arg1,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
