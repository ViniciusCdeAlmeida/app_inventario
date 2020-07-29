import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/levantamentos.dart';
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
    // Future.delayed(Duration.zero).then((_) async {
    //   unidadeArgs = ModalRoute.of(context).settings.arguments;
    //   final conexao =
    //       Provider.of<Autenticacao>(context, listen: false).atualConexao;
    //   await Provider.of<Unidades>(context)
    //       .buscaEstruturasLevantamento(unidadeArgs.id, conexao);
    // });
    // Future.delayed(Duration.zero).then((_) async {
    //   unidadeArgs = ModalRoute.of(context).settings.arguments;
    //   Provider.of<EstruturaLevantamento>(context)
    //       .buscaPorEstrutura(unidadeArgs.id);
    // });
    super.initState();
  }

  Future<void> _carregaUnidades(BuildContext context, String conexao) async {
    // await Provider.of<EstruturaLevantamento>(context, listen: false)
    //     .buscaPorEstrutura(unidadeArgs.id);
  }

  @override
  Widget build(BuildContext context) {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    final unidades = Provider.of<Levantamentos>(context);
    Provider.of<EstruturaLevantamento>(context)
        .buscaPorEstrutura(unidadeArgs.id);

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
              // onRefresh: null,
              child: Consumer<EstruturaLevantamento>(
                builder: (ctx, unidadesData, _) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemBuilder: (_, idx) => Column(
                      children: [
                        UnidadeItem(
                          unidadesData.getLevantamentosEstrutura[idx],
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: unidadesData.getLevantamentosEstrutura.length,
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
