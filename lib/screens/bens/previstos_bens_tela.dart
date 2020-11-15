import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/stores/bensPrevistos_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/custom/customSliverAppBar.dart';

import 'package:app_inventario/models/telaArgumentos.dart';

import 'package:app_inventario/widgets/bens/previstos_bens_item.dart';

class PrevistosBensTela extends StatefulWidget {
  static const routeName = '/bensPrevistosTela';

  @override
  _PrevistosBensTelaState createState() => _PrevistosBensTelaState();
}

class _PrevistosBensTelaState extends State<PrevistosBensTela> {
  TelaArgumentos unidadeArgs;
  BensPrevistosStore _bensPrevistosStore;

  @override
  void didChangeDependencies() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;

    _bensPrevistosStore =
        Provider.of<BensPrevistosStore>(context, listen: false);
    _bensPrevistosStore.limpaFiltrados();
    _bensPrevistosStore.buscaBensPorEstrutura(unidadeArgs.id, unidadeArgs.arg1);
    Provider.of<EstruturaLevantamento>(context).ulAtual(unidadeArgs.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    _bensPrevistosStore =
        Provider.of<BensPrevistosStore>(context, listen: false);
    return Scaffold(
      // drawer: AppDrawer(),
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
                  MySliverAppBar(
                    titulo: unidadeArgs.arg2,
                    filtro: _bensPrevistosStore.filtraBens,
                    limpar: _bensPrevistosStore.limpaFiltrados,
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
