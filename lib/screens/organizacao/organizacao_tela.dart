import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inicializacao.dart';
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
    final inicializacao = Provider.of<Inicializacao>(context);
    final organizacoes = Provider.of<Autenticacao>(context);

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      if (organizacoes.getExisteOrganizacao &&
          inicializacao.getExisteDominios &&
          inicializacao.getExisteBens)
        setState(() {
          _isLoading = false;
          _isInit = false;
        });
    }

    setState(() {
      if ((inicializacao.getExisteDominios && inicializacao.getExisteBens) &&
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
      final inicializacao = Provider.of<Inicializacao>(context, listen: false);
      final organizacoes = Provider.of<Autenticacao>(context, listen: false);
      await organizacoes.getOrganizacoesDB();
      if (!organizacoes.getExisteOrganizacao)
        await organizacoes.getVerificaOrganizacaoDB();
      if (!inicializacao.getExisteDominios)
        await inicializacao.getVerificaDominioDB();
      if (!inicializacao.getExisteBens)
        await inicializacao.getVerificaBensPatrimoniaisDB();
      if (!inicializacao.getExisteDominios && !inicializacao.getExisteBens) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Carregando Dominios e Bens Patrimoniais'),
            duration: Duration(seconds: 1),
          ),
        );
      }

      // if (!organizacoes.getExisteOrganizacao) {
      //   await organizacoes.getOrganizacoesDB();
      // }
      if (!inicializacao.getExisteDominios) {
        await inicializacao.buscaDominioInicial(conexao);
      }
      if (!inicializacao.getExisteBens) {
        await inicializacao.buscaBemPatrimonialInicial(conexao);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final organizacoes = Provider.of<Autenticacao>(context);
    final organizacoesLista = organizacoes.listaOrganizacoes;

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
                      organizacoesLista[idx].organizacao.id,
                      organizacoesLista[idx].organizacao.codigoENome,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
    );
  }
}
