import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inicializacao.dart';
import 'package:app_inventario/stores/inicializacao_store.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/organizacao/organizacao_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class OrganizacaoTela extends StatefulWidget {
  static const routeName = '/organizacaoTela';

  @override
  _OrganizacaoTelaState createState() => _OrganizacaoTelaState();
}

class _OrganizacaoTelaState extends State<OrganizacaoTela> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  InicializacaoStore _inicializacaoStore;
  // List<ReactionDisposer> _disposers;
  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    _inicializacaoStore =
        Provider.of<InicializacaoStore>(context, listen: false);
    final organizacoes = Provider.of<Autenticacao>(context, listen: false);
    organizacoes.getOrganizacoesDB();

    _inicializacaoStore.verificaInicializacao(conexao);

    // _disposers ??= [
    //   autorun((_) => _inicializacaoStore.verificaInicializacao(conexao)),
    // ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final organizacoes = Provider.of<Autenticacao>(context, listen: false);
    final organizacoesLista = organizacoes.listaOrganizacoes;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Selecione a Unidade Organizacional'),
      ),
      drawer: AppDrawer(),
      body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Observer(
            builder: (_) {
              switch (_inicializacaoStore.inicializacaoState) {
                case InicializacaoState.inicial:
                case InicializacaoState.carregandoBensPatrimonias:
                case InicializacaoState.carregandoDominio:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case InicializacaoState.carregadoBensPatrimonias:
                case InicializacaoState.carregadoDominio:
                case InicializacaoState.carregadoInicializacao:
                  return Padding(
                    padding: const EdgeInsets.all(8),
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
                  );
              }
              // switch (_inicializacaoStore.bensPatrimoniaisState) {
              //   case BensPatrimoniaisState.initial:
              //     return Center(
              //       child: Text('BensPatrimoniaisState.initial'),
              //     );
              //   case BensPatrimoniaisState.empty:
              //     return Center(
              //       child: Text('BensPatrimoniaisState.empty'),
              //     );
              //   case BensPatrimoniaisState.loaded:
              //     return Center(
              //       child: Text('BensPatrimoniaisState.loaded'),
              //     );
              //   case BensPatrimoniaisState.loading:
              //     return Center(
              //       child: Text('BensPatrimoniaisState.loading'),
              //     );
              // }
            },
          )
          // _isLoading
          //     ? Center(
          //         child: CircularProgressIndicator(),
          //       )
          // : Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: ListView.builder(
          //       itemCount: organizacoesLista.length,
          //       itemBuilder: (_, idx) => Column(
          //         children: [
          //           OrganizacaoItem(
          //             organizacoesLista[idx].organizacao.id,
          //             organizacoesLista[idx].organizacao.codigoENome,
          //           ),
          //           Divider(),
          //         ],
          //       ),
          //     ),
          //   ),
          ),
    );
  }
}
