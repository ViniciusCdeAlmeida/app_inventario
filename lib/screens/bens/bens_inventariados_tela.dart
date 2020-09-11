import 'package:app_inventario/widgets/bens/bens_inventariados_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';

class BensInventariadosTela extends StatefulWidget {
  static const routeName = '/bensInventariadosTela';

  @override
  _BensInventariadosTelaState createState() => _BensInventariadosTelaState();
}

class _BensInventariadosTelaState extends State<BensInventariadosTela> {
  bool _isInit = true;
  List<InventarioBemPatrimonial> _bensInventariados = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final idUnidade = Provider.of<Autenticacao>(context).idUnidade;
      Provider.of<InventarioBensPatrimoniais>(context)
          .buscaBensInventariados(idUnidade);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _bensInventariados =
        Provider.of<InventarioBensPatrimoniais>(context, listen: false)
            .getInventariados;
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Bens Inventariados'),
            floating: true,
            pinned: false,
            snap: true,
            backgroundColor: Colors.yellow[800],
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.cloud_upload),
                onPressed: () {
                  if (_bensInventariados
                      .where((element) => element.enviado == false)
                      .toList()
                      .isNotEmpty) {
                    Provider.of<InventarioBensPatrimoniais>(context,
                            listen: false)
                        .enviaDados(conexao)
                        .catchError((error) async {
                      await showDialog<Null>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Ocorreu um erro.'),
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
                    }).whenComplete(() => _isInit = true);
                  } else
                    return showDialog<Null>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title:
                            const Text('Não existe itens para serem enviados.'),
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
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              _bensInventariados
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BensInventariadosItem(
                        bemInventariado: item,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
