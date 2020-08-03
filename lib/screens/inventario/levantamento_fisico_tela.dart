import 'package:app_inventario/customizacoes/acoes.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';
import 'package:app_inventario/widgets/inventario/levantamento_fisico_item.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevantamentoFisicoTela extends StatefulWidget {
  static const routeName = '/levantamentoFisicoTela';

  @override
  _LevantamentoFisicoTelaState createState() => _LevantamentoFisicoTelaState();
}

class _LevantamentoFisicoTelaState extends State<LevantamentoFisicoTela> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    final nomeEstrutura = Provider.of<EstruturaLevantamento>(context);
    super.didChangeDependencies();
    if (nomeEstrutura.getNomeEstrutura != null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(nomeEstrutura.getNomeEstrutura),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> _refreshProd2(String conexao, int id, Acoes acoes,
      List<Levantamento> listaLevantamento) async {
    switch (acoes) {
      case Acoes.buscarLevantamentos:
        await Provider.of<Levantamentos>(context)
            .buscaLevantamento(id, conexao);
        break;
      case Acoes.buscarLevantamento:
        print('2');
        break;
      case Acoes.exluirLevantamentos:
        print('3');
        break;
      case Acoes.exluirLevantamento:
        print('4');
        break;
      case Acoes.enviaLevantamento:
        await Provider.of<EstruturaLevantamento>(context)
            .buscaEstruturas(conexao, listaLevantamento);
        break;
      case Acoes.gerarArquivoBackup:
        print('11');
        await Provider.of<BensProvier>(context).buscaBens(conexao);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final conexao = Provider.of<Autenticacao>(context).atualConexao;
    final idOrganizacao = ModalRoute.of(context).settings.arguments;
    final listaLevantamentos = Provider.of<Levantamentos>(context);
    final listaAtual = listaLevantamentos.getLevantamentos;
    final estruturas = Provider.of<EstruturaLevantamento>(context);

    if (listaAtual == null && !listaLevantamentos.isLoading) {
      listaLevantamentos.buscaLevantamento(idOrganizacao, conexao);
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Levantamentos'),
        actions: <Widget>[
          GestureDetector(
            child: PopupMenuButton<Acoes>(
              onSelected: (value) {
                _refreshProd2(conexao, idOrganizacao, value, listaAtual);
              },
              offset: Offset(0, 100),
              itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Carregar Levantamentos', Icons.cloud_download),
                  value: Acoes.buscarLevantamentos,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child:
                      PopupMenuCustom('Carregar Levantamento', Icons.save_alt),
                  value: Acoes.buscarLevantamento,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom('Excluir Levantamentos', Icons.delete),
                  value: Acoes.exluirLevantamentos,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Excluir Levantamento', Icons.delete_outline),
                  value: Acoes.exluirLevantamento,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child:
                      // PopupMenuCustom(
                      //     'Enviar Levantamentos', Icons.cloud_upload),
                      PopupMenuCustom('Buscar Estruturas', Icons.cloud_upload),
                  value: Acoes.enviaLevantamento,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Gerar arquivo de backup', Icons.content_copy),
                  value: Acoes.gerarArquivoBackup,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: listaLevantamentos.isLoading || estruturas.isLoading
          ? Stack(
              children: <Widget>[
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            )
          : Stack(
              children: <Widget>[
                Consumer<Levantamentos>(
                  builder: (context, levantamentoData, child) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: levantamentoData.getLevantamentos.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            LevantamentoFisicoItem(
                              levantamentoData.getLevantamentos[idx],
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Builder(
                //   builder: (context) {
                //     return Flushbar(
                //       title: "Some",
                //       message: "text",
                //       duration: Duration(seconds: 3),
                //       flushbarStyle: FlushbarStyle.FLOATING,
                //       isDismissible: true,
                //       dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                //     )..show(context);
                //   },
                // ),
              ],
            ),
    );
  }
}
