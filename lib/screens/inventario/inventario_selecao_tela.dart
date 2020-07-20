import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inventario.dart';
import 'package:flutter/material.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/inventario/inventario_selecao_item.dart';
import 'package:provider/provider.dart';

class InventarioSelecaoTela extends StatelessWidget {
  static const routeName = '/inventarioSelecaoTela';
  @override
  Widget build(BuildContext context) {
    final inventario = Provider.of<Inventario>(context);
    final TelaArgumentos unidadeDados =
        ModalRoute.of(context).settings.arguments;
    Provider.of<Autenticacao>(context).idUnidade = unidadeDados.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione um tipo de inventario'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
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
