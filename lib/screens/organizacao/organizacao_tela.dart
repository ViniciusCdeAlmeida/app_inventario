// import 'package:app_inventario/models/organizacao.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/organizacao/organizacao_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizacaoTela extends StatefulWidget {
  static const routeName = '/organizacaoTela';
  @override
  _OrganizacaoTelaState createState() => _OrganizacaoTelaState();
}

class _OrganizacaoTelaState extends State<OrganizacaoTela> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      if (Provider.of<Autenticacao>(context).listaOrganizacoes().isNotEmpty)
        setState(() {
          _isLoading = false;
        });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final organizacoes = Provider.of<Autenticacao>(context);
    final organizacoesLista = organizacoes.listaOrganizacoes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bens Previstos'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: organizacoesLista.length,
                itemBuilder: (_, idx) => Column(
                  children: [
                    OrganizacaoItem(
                      organizacoesLista[idx].id,
                      organizacoesLista[idx].codigoENome,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
    );
  }
}
