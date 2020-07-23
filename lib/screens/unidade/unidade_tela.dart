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
  TelaArgumentos unidadeArgs;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      unidadeArgs = ModalRoute.of(context).settings.arguments;
      final conexao =
          Provider.of<Autenticacao>(context, listen: false).atualConexao;
      await Provider.of<Unidades>(context)
          .buscaEstruturasLevantamento(unidadeArgs.id, conexao);
    });
    super.initState();
  }

  Future<void> _carregaUnidades(BuildContext context, String conexao) async {
    await Provider.of<Unidades>(context, listen: false)
        .buscaEstruturasLevantamento(unidadeArgs.id, conexao);
  }

  @override
  Widget build(BuildContext context) {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    final unidades = Provider.of<Unidades>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(unidadeArgs.arg1),
      ),
      drawer: AppDrawer(),
      body: unidades.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _carregaUnidades(context, conexao),
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
      // }
      // ),
      // ),
    );
  }
}
