import 'package:app_inventario/widgets/bens/bens_inventariados_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_inventario/customizacoes/customSliverAppBar.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';

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
                  final conexao =
                      Provider.of<Autenticacao>(context, listen: false)
                          .atualConexao;
                  Provider.of<InventarioBensPatrimoniais>(context,
                          listen: false)
                      .enviaDados(conexao)
                      .whenComplete(() => _isInit = true);
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
