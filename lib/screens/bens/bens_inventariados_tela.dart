import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:GRPInventario/stores/index.dart';
import 'package:GRPInventario/widgets/index.dart';

import 'package:GRPInventario/providers/index.dart';

class BensInventariadosTela extends StatefulWidget {
  static const routeName = '/bensInventariadosTela';

  @override
  _BensInventariadosTelaState createState() => _BensInventariadosTelaState();
}

class _BensInventariadosTelaState extends State<BensInventariadosTela> {
  BensInventariadoStore _bensInventariadoStore;
  final _sliver = GlobalKey();

  @override
  void didChangeDependencies() {
    final idUnidade = Provider.of<Autenticacao>(context).idUnidade;
    _bensInventariadoStore =
        Provider.of<BensInventariadoStore>(context, listen: false);
    _bensInventariadoStore.buscaBensColetados(idUnidade);
    super.didChangeDependencies();
  }

  SliverAppBar appBar(int idUnidade) {
    return SliverAppBar(
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
          icon: _bensInventariadoStore.existeBensParaEnviar
              ? Icon(Icons.cloud_upload)
              : Icon(Icons.cloud_upload_outlined),
          onPressed: () {
            _bensInventariadoStore.enviaBensColetados(idUnidade).catchError(
              (error) async {
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
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final idUnidade = Provider.of<Autenticacao>(context).idUnidade;

    return Scaffold(
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_bensInventariadoStore.bensInventariadoState) {
            case BensInventariadoState.inicial:
            case BensInventariadoState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case BensInventariadoState.carregado:
              return CustomScrollView(
                key: _sliver,
                slivers: [
                  appBar(idUnidade),
                  _bensInventariadoStore.enviandoBens
                      ? SliverFillViewport(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return FlareActor(
                                "assets/animations/Upload.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.scaleDown,
                                animation: "upload",
                              );
                            },
                            childCount: 1,
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate(
                            _bensInventariadoStore.bensInventariados.isNotEmpty
                                ? _bensInventariadoStore.bensInventariados
                                    .map(
                                      (item) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BensInventariadosItem(
                                          bemInventariado: item,
                                        ),
                                      ),
                                    )
                                    .toList()
                                : [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: FlareActor(
                                          "assets/animations/empty.flr",
                                          alignment: Alignment.center,
                                          fit: BoxFit.scaleDown,
                                          animation: "idle",
                                        ),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                ],
              );
          }
        },
      ),
    );
  }
}
