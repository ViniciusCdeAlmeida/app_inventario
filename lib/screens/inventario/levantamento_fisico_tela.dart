import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/widgets/cabecalho/acoes_levantamento_cabecalho.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevantamentoFisicoTela extends StatefulWidget {
  static const routeName = '/levantamentoFisicoTela';
  @override
  _LevantamentoFisicoTelaState createState() => _LevantamentoFisicoTelaState();
}

class _LevantamentoFisicoTelaState extends State<LevantamentoFisicoTela> {
  @override
  Widget build(BuildContext context) {
    final conexao = Provider.of<Autenticacao>(context).atualConexao;
    final idOrganizacao = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Levantamentos'),
        actions: <Widget>[
          AcoesLevantamento(conexao, idOrganizacao),
        ],
      ),
      drawer: AppDrawer(),
      body: Text('Levantamento fisico'),
    );
  }
}
