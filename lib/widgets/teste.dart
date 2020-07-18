import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/widgets/inventario/levantamentoFisico/levantamento_fisico_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TesteRoda extends StatelessWidget {
  Future<void> _refreshProd(
    BuildContext context,
    String conexao,
    int idOrganizacao,
  ) async {
    await Provider.of<Levantamentos>(context)
        .buscaLevantamento(idOrganizacao, conexao);
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    final String conexao = Provider.of<Autenticacao>(context).atualConexao;
    final int idUnidade = Provider.of<Autenticacao>(context).idUnidade;
    return FutureBuilder(
      future: _refreshProd(context, conexao, idUnidade),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Levantamentos>(
                  builder: (ctx, productsData, _) => Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemBuilder: (_, idx) => Column(
                        children: [
                          LevantamentoFisicoItem(
                            productsData.levantamentos[idx],
                          ),
                          Divider(),
                        ],
                      ),
                      itemCount: productsData.levantamentos.length,
                    ),
                  ),
                ),
    );
  }
}
