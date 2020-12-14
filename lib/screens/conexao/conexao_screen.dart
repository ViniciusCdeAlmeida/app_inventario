import 'package:GRPInventario/screens/conexao/widgets/conexao/conexao_item.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:GRPInventario/components/stores/index_store.dart';

import 'package:GRPInventario/screens/index_screens.dart';

class ConexaoScreen extends StatefulWidget {
  static const routeName = '/conexaoScreen';

  @override
  _ConexaoScreenState createState() => _ConexaoScreenState();
}

class _ConexaoScreenState extends State<ConexaoScreen> {
  ConexaoStore _conexaoStore;
  @override
  void didChangeDependencies() {
    _conexaoStore = Provider.of<ConexaoStore>(context, listen: false);
    _conexaoStore.buscarConexoes();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de conexão'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ConexaoEdicaoScreen.routeName);
            },
          ),
        ],
      ),
      drawer: MenuDrawer(),
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_conexaoStore.conexoesState) {
            case ConexoesState.inicial:
              return Center(
                child: Text('vazio'),
              );
            case ConexoesState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConexoesState.carregado:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: _conexaoStore.conexoes.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      ConexaoItem(
                        id: _conexaoStore.conexoes[i].id,
                        url: _conexaoStore.conexoes[i].url,
                        nome: _conexaoStore.conexoes[i].nome,
                        ativo: _conexaoStore.conexoes[i].ativo,
                      ),
                      Divider()
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
