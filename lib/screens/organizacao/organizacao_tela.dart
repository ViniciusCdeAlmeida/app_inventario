import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/dominioProvider.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    final dominios = Provider.of<DominioProvier>(context);
    final bensPatrimoniais = Provider.of<BensProvier>(context);
    final organizacoes = Provider.of<Autenticacao>(context);
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      if (organizacoes.lista2Organizacoes.isNotEmpty &&
          dominios.getDominios.isNotEmpty &&
          bensPatrimoniais.getBens.isNotEmpty)
        setState(() {
          _isLoading = false;
          _isInit = false;
        });
    }

    setState(() {
      if ((dominios.getDominios.isNotEmpty &&
              bensPatrimoniais.getBens.isNotEmpty) &&
          _scaffoldKey.currentState != null) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Dominios e Bens Patrimoniais Carregados'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      final conexao =
          Provider.of<Autenticacao>(context, listen: false).atualConexao;
      final dominios = Provider.of<DominioProvier>(context, listen: false);
      final bensPatrimoniais = Provider.of<BensProvier>(context, listen: false);

      if (dominios.getDominios.isEmpty && bensPatrimoniais.getBens.isEmpty) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Carregando Dominios e Bens Patrimoniais'),
            duration: Duration(seconds: 1),
          ),
        );
      }

      if (dominios.getDominios.isEmpty) {
        await dominios.buscaDominios(conexao);
      }
      if (bensPatrimoniais.getBens.isEmpty) {
        await bensPatrimoniais.buscaBens(conexao);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final organizacoes = Provider.of<Autenticacao>(context);
    final organizacoesLista = organizacoes.listaOrganizacoes();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Selecione a Unidade Organizacional'),
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
