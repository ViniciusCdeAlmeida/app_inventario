import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/stores/estruturaLevantamento_store.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/unidade/unidade_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UnidadeTela extends StatefulWidget {
  static const routeName = '/unidadeTela';
  @override
  _UnidadeTelaState createState() => _UnidadeTelaState();
}

class _UnidadeTelaState extends State<UnidadeTela> {
  EstruturaLevantamentoStore _estruturaLevantamentoStore;
  TelaArgumentos unidadeArgs;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(unidadeArgs.arg1),
      ),
      drawer: AppDrawer(),
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
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: _estruturaLevantamentoStore.estruturas.length,
                  itemBuilder: (_, idx) => Column(
                    children: [
                      UnidadeItem(
                        _estruturaLevantamentoStore.estruturas[idx],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
