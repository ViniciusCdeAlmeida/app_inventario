import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/widgets/index.dart';

import 'package:GRPInventario/models/telaArgumentos.dart';
import 'package:GRPInventario/providers/index.dart';

class InventarioSelecaoTela extends StatelessWidget {
  static const routeName = '/inventarioSelecaoTela';
  @override
  Widget build(BuildContext context) {
    final inventario = Provider.of<Inventario>(context, listen: false);
    final TelaArgumentos unidadeDados =
        ModalRoute.of(context).settings.arguments;
    Provider.of<Autenticacao>(context, listen: false).idUnidade =
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
