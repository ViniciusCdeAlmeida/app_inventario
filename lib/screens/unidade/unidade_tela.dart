// import 'package:app_inventario/models/organizacao.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/unidade.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/unidade/unidade_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UnidadeTela extends StatefulWidget {
  static const routeName = '/unidadeTela';
  @override
  _UnidadeTelaState createState() => _UnidadeTelaState();
}

class _UnidadeTelaState extends State<UnidadeTela> {
  Key refeshKey = UniqueKey();
  var _isLoading = false;
  TelaArgumentos unidadeArgs;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      unidadeArgs = ModalRoute.of(context).settings.arguments;
      final conexao =
          Provider.of<Autenticacao>(context, listen: false).atualConexao;
      // final idInventario = ModalRoute.of(context).settings.arguments;
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Unidades>(context)
          .buscaEstruturasLevantamento(unidadeArgs.id, conexao);
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> _carregaUnidades(BuildContext context) async {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    await Provider.of<Unidades>(context, listen: false)
        .buscaEstruturasLevantamento(unidadeArgs.id, conexao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(unidadeArgs.arg1),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              key: refeshKey,
              onRefresh: () => _carregaUnidades(context),
              child: Consumer<Unidades>(
                builder: (ctx, unidadesData, _) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemBuilder: (_, idx) => Column(
                      children: [
                        UnidadeItem(
                          unidadesData.getUnidades[idx],
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: unidadesData.getUnidades.length,
                  ),
                ),
              ),
            ),
      // ),
    );
  }
}
