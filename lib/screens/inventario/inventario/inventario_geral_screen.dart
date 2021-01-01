import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/main.dart';
import 'package:GRPInventario/screens/index_screens.dart';
import 'package:GRPInventario/providers/stores/index_store.dart';
import 'package:GRPInventario/utils/index_utils.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:GRPInventario/screens/inventario/inventario/widgets/inventario/inventario_geral_item.dart';

class InventarioGeralScreen extends StatefulWidget {
  static const routeName = '/inventarioGeralScreen';
  @override
  _InventarioGeralScreenState createState() => _InventarioGeralScreenState();
}

class _InventarioGeralScreenState extends State<InventarioGeralScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();
  final _form = GlobalKey<FormState>();
  InventarioStore _inventarioStore;
  int idOrganizacao;

  @override
  void didChangeDependencies() {
    _inventarioStore = Provider.of<InventarioStore>(context, listen: false);
    idOrganizacao = ModalRoute.of(context).settings.arguments;
    _inventarioStore.verificaInventarios(idOrganizacao, false);
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
        Navigator.of(context).pushNamed(BensInventariadosScreen.routeName);
        break;
      case Acoes.buscarLevantamento:
        _leituraCodigoLevantamento(idOrganizacao, context);
        break;
      case Acoes.buscarLevantamentos:
        _inventarioStore.verificaInventarios(idOrganizacao, true);
        break;
      case Acoes.buscarEstruturas:
        try {
          await _inventarioStore
              .buscaEstruturasInventarios(_inventarioStore.inventariosDados);
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

  Future<void> _buscaInventario(
      int idOrganizacao, String codigo, BuildContext context) async {
    try {
      await _inventarioStore.buscaInventario(codigo);
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
                top: 10.0,
                left: 10.0,
                right: 10.0,
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
                      _buscaInventario(idOrganizacao, _controller.text, ctx);
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
        title: Text('Inventários'),
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
                  child: PopupMenuCustom('Buscar inventarios', Icons.save_alt),
                  value: Acoes.buscarLevantamentos,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Buscar inventario', Icons.download_sharp),
                  value: Acoes.buscarLevantamento,
                ),
                const PopupMenuDivider(),
                PopupMenuItem<Acoes>(
                  child: PopupMenuCustom(
                      'Buscar todas estruturas', Icons.cloud_download),
                  value: Acoes.buscarEstruturas,
                ),
                const PopupMenuDivider(),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_inventarioStore.inventarioState) {
            case InventarioState.inicial:
            case InventarioState.vazio:
              return Center(
                child: Text('VAZIO'),
              );
            case InventarioState.carregando:
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            case InventarioState.carregado:
              return Padding(
                key: UniqueKey(),
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: _inventarioStore.inventariosDados.length,
                  itemBuilder: (_, idx) => Column(
                    children: [
                      InventarioGeralItem(
                        _inventarioStore.inventariosDados[idx],
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
