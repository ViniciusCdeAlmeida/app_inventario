import 'package:GRPInventario/screens/inventario/widgets/inventario/inventario_selecao_item.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/providers/index_providers.dart';

class InventarioSelecaoScreen extends StatelessWidget {
  static const routeName = '/inventarioSelecaoScreen';
  @override
  Widget build(BuildContext context) {
    final inventario =
        Provider.of<TipoInventarioProvider>(context, listen: false);
    final ScreenArgumentos unidadeDados =
        ModalRoute.of(context).settings.arguments;
    Provider.of<AutenticacaoProvider>(context, listen: false).idUnidade =
        unidadeDados.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione um tipo de inventario'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Unidade selecionada: ' + unidadeDados.arg1,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListView.builder(
            itemCount: inventario.tipoInventario.length,
            shrinkWrap: true,
            itemBuilder: (_, idx) => Column(
              children: [
                InventarioSelecaoItem(
                  inventario.tipoInventario[idx]['nome'],
                  inventario.tipoInventario[idx]['tipo'],
                  unidadeDados.id,
                ),
                Divider(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
