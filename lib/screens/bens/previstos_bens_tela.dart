import 'package:app_inventario/customizacoes/customSliverAppBar.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/widgets/bens/previstos_bens_item.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrevistosBensTela extends StatefulWidget {
  static const routeName = '/bensPrevistosTela';

  @override
  _PrevistosBensTelaState createState() => _PrevistosBensTelaState();
}

class _PrevistosBensTelaState extends State<PrevistosBensTela> {
  TelaArgumentos unidadeArgs;
  bool _isInit = true;
  List<DadosBensPatrimoniais> _dadosPatrimoniais = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      unidadeArgs = ModalRoute.of(context).settings.arguments;
      Provider.of<EstruturaLevantamento>(context)
          .buscaBensPorEstrutura(unidadeArgs.id, unidadeArgs.arg1);
      Provider.of<EstruturaLevantamento>(context).setUlAtual(unidadeArgs.id);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _dadosPatrimoniais =
        Provider.of<EstruturaLevantamento>(context, listen: false)
            .getBensPorEstrutura;
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            titulo: 'Bens Previstos',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              _dadosPatrimoniais
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
      ),
      drawer: AppDrawer(),
    );
  }
}
