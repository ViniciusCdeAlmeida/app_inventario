import 'package:app_inventario/screens/bens/bens_inventariados_tela.dart';
import 'package:app_inventario/stores/levantamento_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/custom/acoes.dart';

import 'package:app_inventario/main.dart';

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
  final _controller = TextEditingController();
  final _form = GlobalKey<FormState>();
  LevantamentoStore _levantamentoStore;
  int idOrganizacao;

  @override
  void didChangeDependencies() {
    _levantamentoStore = Provider.of<LevantamentoStore>(context, listen: false);
    idOrganizacao = ModalRoute.of(context).settings.arguments;
    _levantamentoStore.verificaLevantamentos(idOrganizacao, false);
    super.didChangeDependencies();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _actionButtons(int id, Acoes acoes) async {
    switch (acoes) {
      case Acoes.acessarBanco:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
        break;
      case Acoes.itensInventariados:
        Navigator.of(context).pushNamed(BensInventariadosTela.routeName);
        break;
      case Acoes.buscarLevantamento:
        _leituraCodigoLevantamento(idOrganizacao, context);
        break;
      case Acoes.buscarLevantamentos:
        _levantamentoStore.verificaLevantamentos(idOrganizacao, true);
        break;
      case Acoes.buscarEstruturas:
        try {
          await _levantamentoStore
              .buscaEstruturasInventario(_levantamentoStore.levantamentosDados);
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
    }
  }

  Future<void> _buscaLevantamento(
      int idOrganizacao, String codigo, BuildContext context) async {
    try {
      await _levantamentoStore.buscaLevantamento(codigo);
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro.'),
          content: Text((error as StateError).message),
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
  }

  void _leituraCodigoLevantamento(int idOrganizacao, BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return SingleChildScrollView(
          child: Card(
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Form(
                    key: _form,
                    child: TextFormField(
                      key: Key('codigoText'),
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Código',
                        helperText: 'Informe o código do levantamento.',
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      _buscaLevantamento(idOrganizacao, _controller.text, ctx);
                      _controller.text = null;
                    },
                    label: Text('Buscar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Levantamentos'),
        actions: <Widget>[
          GestureDetector(
            child: PopupMenuButton<Acoes>(
              onSelected: (value) {
                _actionButtons(idOrganizacao, value);
              },
              offset: Offset(0, 100),
              itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Itens inventariados', Icons.cloud_upload),
                  value: Acoes.itensInventariados,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Acessar banco de dados', Icons.description),
                  value: Acoes.acessarBanco,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child:
                      PopupMenuCustom('Buscar levantamentos', Icons.save_alt),
                  value: Acoes.buscarLevantamentos,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Buscar levantamento', Icons.download_sharp),
                  value: Acoes.buscarLevantamento,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Buscar todas estruturas', Icons.cloud_download),
                  value: Acoes.buscarEstruturas,
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
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_levantamentoStore.inventarioState) {
            case LevantamentosState.inicial:
            case LevantamentosState.vazio:
              return Center(
                child: Text('VAZIO'),
              );
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
                  itemCount: _levantamentoStore.levantamentosDados.length,
                  itemBuilder: (_, idx) => Column(
                    children: [
                      LevantamentoFisicoItem(
                        _levantamentoStore.levantamentosDados[idx],
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
