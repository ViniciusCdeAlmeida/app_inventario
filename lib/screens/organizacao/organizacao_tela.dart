import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:app_inventario/custom/index.dart';
import 'package:app_inventario/stores/index.dart';
import 'package:app_inventario/widgets/index.dart';

class OrganizacaoTela extends StatefulWidget {
  static const routeName = '/organizacaoTela';

  @override
  _OrganizacaoTelaState createState() => _OrganizacaoTelaState();
}

class _OrganizacaoTelaState extends State<OrganizacaoTela> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  InicializacaoStore _inicializacaoStore;

  @override
  void didChangeDependencies() {
    _inicializacaoStore =
        Provider.of<InicializacaoStore>(context, listen: false);
    _inicializacaoStore
        .verificaOrganizacoes()
        .catchError((onError) => print('onError1'));
    _inicializacaoStore.verificaInicializacao().catchError((_) {
      Navigator.pop(context);
      return erroDialog(context, null);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Selecione a Unidade Organizacional',
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(fontSize: 16.0),
          maxLines: 3,
        ),
      ),
      drawer: AppDrawer(),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Observer(
          // ignore: missing_return
          builder: (_) {
            switch (_inicializacaoStore.inicializacaoState) {
              case InicializacaoState.inicial:
              case InicializacaoState.carregando:
                return Center(
                  child: Container(
                    height: 72,
                    child: Column(
                      children: [
                        Text('Carregando bens patrimoniais...'),
                        Container(
                          height: 35,
                          padding: EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(
                            value: _inicializacaoStore.progress,
                          ),
                        ),
                        Container(
                          child: Text(
                            '${(_inicializacaoStore.progress * 100).ceil()}%',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              case InicializacaoState.carregado:
              case InicializacaoState.carregadoInicializacao:
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: _inicializacaoStore.organizacoes.length,
                    itemBuilder: (_, idx) => Column(
                      children: [
                        OrganizacaoItem(
                          _inicializacaoStore.organizacoes[idx].organizacao.id,
                          _inicializacaoStore
                              .organizacoes[idx].organizacao.codigoENome,
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
