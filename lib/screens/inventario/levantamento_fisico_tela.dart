import 'package:app_inventario/screens/bens/bens_inventariados_tela.dart';
import 'package:app_inventario/stores/inicializacao_store.dart';
import 'package:app_inventario/stores/levantamento_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:provider/provider.dart';
import 'package:app_inventario/custom/acoes.dart';

import 'package:app_inventario/main.dart';
import 'package:app_inventario/models/serialized/levantamento.dart';

import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/levantamentos.dart';

import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';
import 'package:app_inventario/widgets/inventario/levantamento_fisico_item.dart';

class LevantamentoFisicoTela extends StatefulWidget {
  static const routeName = '/levantamentoFisicoTela';

  @override
  _LevantamentoFisicoTelaState createState() => _LevantamentoFisicoTelaState();
}

class _LevantamentoFisicoTelaState extends State<LevantamentoFisicoTela> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Levantamento> listaAtual = [];
  LevantamentoStore _levantamentoStore;

  @override
  void didChangeDependencies() {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    _levantamentoStore = Provider.of<LevantamentoStore>(context, listen: false);
    final idOrganizacao = ModalRoute.of(context).settings.arguments;

    _levantamentoStore.verificaInventarios(conexao, idOrganizacao);
    super.didChangeDependencies();
    // final nomeEstrutura = Provider.of<EstruturaLevantamento>(context);
    // nomeEstrutura.getNomeEstrutura;
    // if (nomeEstrutura.getNomeEstrutura != null) {
    //   _scaffoldKey.currentState.showSnackBar(
    //     SnackBar(
    //       content: Text(nomeEstrutura.getNomeEstrutura),
    //       duration: Duration(seconds: 1),
    //     ),
    //   );
    // }
  }

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((_) async {
  //     await Provider.of<Levantamentos>(context, listen: false)
  //         .getVerificaInventariosDB();
  //   });
  //   super.initState();
  // }

  Future<void> _actionButtons(String conexao, int id, Acoes acoes,
      List<Levantamento> listaLevantamento) async {
    switch (acoes) {
      case Acoes.buscarLevantamentos:
        try {
          await Provider.of<Levantamentos>(context)
              .buscaLevantamento(id, conexao);
        } catch (error) {
          await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Ocorreu um erro. . '),
              content: Text(error.toString()),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('OK'),
                )
              ],
            ),
          );
        }
        break;
      case Acoes.buscarLevantamento:
        break;
      case Acoes.acessarBanco:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
        break;
      case Acoes.itensInventariados:
        Navigator.of(context).pushNamed(BensInventariadosTela.routeName);
        break;
      case Acoes.itensInventariados:
        print('3');
        break;
      case Acoes.exluirLevantamento:
        print('4');
        break;
      case Acoes.enviaLevantamento:
        try {
          // await Provider.of<EstruturaLevantamento>(context, listen: false)
          //     .buscaEstruturas(conexao, listaLevantamento);
          await _levantamentoStore.buscaEstruturasInventario(
              conexao, _levantamentoStore.levantamentos);
        } catch (error) {
          await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Ocorreu um erro.'),
              content: Text(error),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('OK'),
                )
              ],
            ),
          );
        }
        break;
      case Acoes.gerarArquivoBackup:
        print('11');
        await Provider.of<BensProvier>(context).buscaBens(conexao);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    final idOrganizacao = ModalRoute.of(context).settings.arguments;
    listaAtual = _levantamentoStore.levantamentos;
    // final levantamentos = Provider.of<Levantamentos>(context, listen: false);
    // final levantamentos = Provider.of<Levantamentos>(context, listen: false);
    // final estruturas = Provider.of<EstruturaLevantamento>(context);

    // if (!levantamentos.getExisteInventarios && !levantamentos.isLoading) {
    //   levantamentos
    //       .buscaLevantamento(idOrganizacao, conexao)
    //       .catchError((error) async {
    //     await showDialog<Null>(
    //       context: context,
    //       builder: (ctx) => AlertDialog(
    //         title: const Text('Ocorreu um erro. . '),
    //         content: Text(error.toString()),
    //         actions: <Widget>[
    //           FlatButton(
    //             onPressed: () {
    //               Navigator.of(ctx).pop();
    //             },
    //             child: Text('OK'),
    //           )
    //         ],
    //       ),
    //     );
    //   });
    // }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Levantamentos'),
        actions: <Widget>[
          GestureDetector(
            child: PopupMenuButton<Acoes>(
              onSelected: (value) {
                _actionButtons(conexao, idOrganizacao, value, listaAtual);
              },
              offset: Offset(0, 100),
              itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom('Itens inventariados', Icons.check),
                  value: Acoes.itensInventariados,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Acessar banco de dados', Icons.description),
                  value: Acoes.acessarBanco,
                ),
                // const PopupMenuDivider(),
                // PopupMenuItem<Acoes>(
                //   child: PopupMenuCustom('Excluir Levantamentos', Icons.delete),
                //   value: Acoes.exluirLevantamentos,
                // ),
                // const PopupMenuDivider(),
                // PopupMenuItem<Acoes>(
                //   child: PopupMenuCustom(
                //       'Excluir Levantamento', Icons.delete_outline),
                //   value: Acoes.exluirLevantamento,
                // ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Buscar Estruturas', Icons.cloud_download),
                  value: Acoes.enviaLevantamento,
                ),
                const PopupMenuDivider(),
                // PopupMenuItem<Acoes>(
                //   child: PopupMenuCustom(
                //       'Gerar arquivo de backup', Icons.content_copy),
                //   value: Acoes.gerarArquivoBackup,
                // ),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Observer(
            // ignore: missing_return
            builder: (_) {
              switch (_levantamentoStore.inventarioState) {
                case LevantamentosState.inicial:
                case LevantamentosState.carregando:
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );
                case LevantamentosState.carregado:
                  return Padding(
                    key: UniqueKey(),
                    padding: const EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: _levantamentoStore.levantamentos.length,
                      itemBuilder: (_, idx) => Column(
                        children: [
                          LevantamentoFisicoItem(
                            _levantamentoStore.levantamentos[idx],
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  );
              }
            },
          )
          // levantamentos.isLoading || estruturas.isLoadingEstruturas
          //     ? Center(
          //         key: UniqueKey(),
          //         child: CircularProgressIndicator(
          //           backgroundColor: Colors.white,
          //         ),
          //       )
          // : Consumer<Levantamentos>(
          //     key: UniqueKey(),
          //     builder: (context, levantamentoData, child) {
          //       return Padding(
          //         padding: const EdgeInsets.all(8),
          //         child: ListView.builder(
          //           itemCount: levantamentoData.getLevantamentos.length,
          //           itemBuilder: (_, idx) => Column(
          //             children: [
          //               LevantamentoFisicoItem(
          //                 levantamentoData.getLevantamentos[idx],
          //               ),
          //               Divider(),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          ),
    );
  }
}
