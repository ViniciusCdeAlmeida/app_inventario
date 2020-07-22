import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/widgets/cabecalho/acoes_inventario_cabecalho.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioGeralTela extends StatefulWidget {
  static const routeName = '/inventarioGeralTela';
  @override
  _InventarioGeralTelaState createState() => _InventarioGeralTelaState();
}

class _InventarioGeralTelaState extends State<InventarioGeralTela> {
  @override
  Widget build(BuildContext context) {
    final conexao = Provider.of<Autenticacao>(context).atualConexao;
    final idOrganizacao = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventarios'),
        actions: <Widget>[
          AcoesInventario(conexao, idOrganizacao),
        ],
      ),
      drawer: AppDrawer(),
      body: Text('Inventario Geral'),
    );
  }
}
