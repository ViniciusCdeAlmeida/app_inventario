import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/widgets/bens/previstos_bens_item.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrevistosBensTela extends StatelessWidget {
  static const routeName = '/bensPrevistosTela';
  @override
  Widget build(BuildContext context) {
    final idEstrutura = ModalRoute.of(context).settings.arguments;
    Provider.of<EstruturaLevantamento>(context, listen: false)
        .buscaBensPorEstrutura(idEstrutura);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bens Previstos'),
      ),
      drawer: AppDrawer(),
      body: Consumer<EstruturaLevantamento>(
        builder: (context, estruturaLevantamentoData, child) => Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: estruturaLevantamentoData.getBensPorEstrutura.length,
            itemBuilder: (_, idx) => Column(
              children: [
                PrevistosBensItem(
                  bemInventario:
                      estruturaLevantamentoData.getBensPorEstrutura[idx],
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
