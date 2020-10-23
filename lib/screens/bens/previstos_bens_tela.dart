import 'package:app_inventario/stores/bensPatrimoniais_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/custom/customSliverAppBar.dart';

import 'package:app_inventario/models/telaArgumentos.dart';

import 'package:app_inventario/widgets/bens/previstos_bens_item.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';

class PrevistosBensTela extends StatefulWidget {
  static const routeName = '/bensPrevistosTela';

  @override
  _PrevistosBensTelaState createState() => _PrevistosBensTelaState();
}

class _PrevistosBensTelaState extends State<PrevistosBensTela> {
  TelaArgumentos unidadeArgs;
  BensPatrimoniaisStore _bensPatrimoniaisStore;

  @override
  void didChangeDependencies() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;

    _bensPatrimoniaisStore =
        Provider.of<BensPatrimoniaisStore>(context, listen: false);
    _bensPatrimoniaisStore.limpaFiltrados();
    _bensPatrimoniaisStore.buscaBensPorEstrutura(
        unidadeArgs.id, unidadeArgs.arg1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      drawer: AppDrawer(),
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_bensPatrimoniaisStore.estruturasState) {
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
                  MySliverAppBar(
                    titulo: 'Bens',
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _bensPatrimoniaisStore.dadosBemPatrimoniais
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Observer(
                                builder: (_) => PrevistosBensItem(
                                  bemInventario: _bensPatrimoniaisStore
                                      .dadosBemPatrimoniais
                                      .firstWhere(
                                          (element) => element.id == item.id),
                                  idInventarioEstrutura: unidadeArgs.arg1,
                                ),
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
