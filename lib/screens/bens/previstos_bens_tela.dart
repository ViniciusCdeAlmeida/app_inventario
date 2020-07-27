import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/widgets/bens/previstos_bens_item.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrevistosBensTela extends StatelessWidget {
  static const routeName = '/bensPrevistosTela';
  @override
  Widget build(BuildContext context) {
    final idEstrutura = ModalRoute.of(context).settings.arguments;
    final bens = Provider.of<BensProvier>(context);
    final listaBens = Provider.of<BensProvier>(context, listen: false)
        .buscaPorEstrutura(idEstrutura);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bens Previstos'),
      ),
      drawer: AppDrawer(),
      body: bens.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: bens.getBensEstrutura.length,
                itemBuilder: (_, idx) => Column(
                  children: [
                    PrevistosBensItem(
                      bens.getBensEstrutura[idx],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
    );
  }
}
