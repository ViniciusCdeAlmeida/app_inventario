import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  static const routeName = '/teste';
  // final String data;

  // Teste(this.data);

  @override
  Widget build(BuildContext context) {
    final idItem = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(idItem),
      ),
      drawer: AppDrawer(),
    );
  }
}
