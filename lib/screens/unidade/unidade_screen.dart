import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/components/stores/index_store.dart';
import 'package:GRPInventario/screens/unidade/widgets/unidade/unidade_item.dart';
import 'package:GRPInventario/widgets/index_widget.dart';

// ignore: must_be_immutable
class UnidadeScreen extends StatefulWidget {
  static const routeName = '/unidadeScreen';
  @override
  _UnidadeScreenState createState() => _UnidadeScreenState();
}

class _UnidadeScreenState extends State<UnidadeScreen> {
  EstruturaLevantamentoStore _estruturaLevantamentoStore;
  ScreenArgumentos unidadeArgs;

  @override
  void didChangeDependencies() {
    _estruturaLevantamentoStore =
        Provider.of<EstruturaLevantamentoStore>(context, listen: false);
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    _estruturaLevantamentoStore.verificaInventarios(unidadeArgs.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _estruturaLevantamentoStore =
        Provider.of<EstruturaLevantamentoStore>(context, listen: false);
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_estruturaLevantamentoStore.estruturasState) {
            case EstruturasLevantamentoState.inicial:
            case EstruturasLevantamentoState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case EstruturasLevantamentoState.vazio:
              return Center(
                child: Text('VAZIO'),
              );
            case EstruturasLevantamentoState.carregado:
              return CustomScrollView(
                slivers: [
                  MySliverAppBar(
                    titulo: unidadeArgs.arg1,
                    filtro: _estruturaLevantamentoStore.filtraBens,
                    limpar: _estruturaLevantamentoStore.limpaFiltrados,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _estruturaLevantamentoStore.estruturas
                          .map(
                            (estrutura) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UnidadeItem(estrutura),
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
