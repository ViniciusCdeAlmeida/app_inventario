import 'package:app_inventario/customizacoes/acoes.dart';
import 'package:app_inventario/customizacoes/estagios.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';
import 'package:app_inventario/widgets/inventario/levantamento_fisico_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevantamentoFisicoTela extends StatefulWidget {
  static const routeName = '/levantamentoFisicoTela';

  @override
  _LevantamentoFisicoTelaState createState() => _LevantamentoFisicoTelaState();
}

class _LevantamentoFisicoTelaState extends State<LevantamentoFisicoTela> {
  List<Levantamento> levantamentosLista;
  var _isInit = true;
  // var _isLoading = false;
  Estagios _estagio = Estagios.INICIAL;
  Acoes test;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        // _isLoading = true;
      });
      if (Provider.of<Levantamentos>(context).levantamentos.isEmpty)
        setState(() {
          // _isLoading = false;
        });
    }
    _isInit = false;
    // print(_isLoading);
    super.didChangeDependencies();
  }

  Future<void> _refreshProd2(
      BuildContext context, String conexao, int id, Acoes acoes) async {
    switch (acoes) {
      case Acoes.buscarLevantamentos:
        await Provider.of<Levantamentos>(context)
            .buscaLevantamento(id, conexao);
        this.levantamentosLista =
            Provider.of<Levantamentos>(context).levantamentos;
        _estagio = Estagios.FINALIZADO;
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
        print('5');
        break;
      case Acoes.gerarArquivoBackup:
        print('11');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final conexao = Provider.of<Autenticacao>(context).atualConexao;
    final idOrganizacao = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Levantamentos'),
        actions: <Widget>[
          GestureDetector(
            child: PopupMenuButton<Acoes>(
              onSelected: (value) {
                setState(
                  () {
                    test = value;
                    _estagio = Estagios.CARREGANDO;
                  },
                );
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
                  child: PopupMenuCustom(
                      'Enviar Levantamentos', Icons.cloud_upload),
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
      body: _estagio == Estagios.INICIAL
          ? null
          : _estagio == Estagios.CARREGANDO
              ? FutureBuilder(
                  future: _refreshProd2(context, conexao, idOrganizacao, test),
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                )
              : Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: this.levantamentosLista.length,
                    itemBuilder: (_, idx) => Column(
                      children: [
                        LevantamentoFisicoItem(
                          this.levantamentosLista[idx],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
    );
  }
}

// body: _estagio == Estagios.FINALIZADO
//           ? Padding(
//               padding: EdgeInsets.all(8),
//               child: ListView.builder(
//                 itemCount: levantamentosLista.length,
//                 itemBuilder: (_, idx) => Column(
//                   children: [
// LevantamentoFisicoItem(
//   levantamentosLista[idx],
// ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//             )
//           : _estagio == Estagios.FINALIZADO
//               ? CircularProgressIndicator()
//               : null,
