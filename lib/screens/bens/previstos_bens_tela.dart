import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/custom/index.dart';
import 'package:GRPInventario/providers/index.dart';
import 'package:GRPInventario/stores/index.dart';

import 'package:GRPInventario/models/telaArgumentos.dart';

import 'package:GRPInventario/widgets/index.dart';

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
