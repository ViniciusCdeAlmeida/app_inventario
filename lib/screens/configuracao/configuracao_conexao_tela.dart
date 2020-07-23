import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/cabecalho/menu_cabecalho.dart';
import '../../screens/configuracao/configuracao_conexao_edicao_tela.dart';
import '../../providers/configuracao_conexao.dart';
import '../../widgets/configuracao/configuracao_conexao_item.dart';

class ConfiguracaoConexaoTela extends StatelessWidget {
  static const routeName = '/configuracaoTela';

  @override
  Widget build(BuildContext context) {
    final conexoesDados = Provider.of<ConfiguracaoConexao>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de conexão'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ConfiguracaoConexaoEdicaoTela.routeName);
            },
          ),
        ],
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: conexoesDados.conexoes.length,
          itemBuilder: (_, i) => Column(
            children: [
              ConfiguracaoConexaoItem(
                id: conexoesDados.conexoes[i].id,
                url: conexoesDados.conexoes[i].url,
                nome: conexoesDados.conexoes[i].nome,
                ativo: conexoesDados.conexoes[i].ativo,
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
