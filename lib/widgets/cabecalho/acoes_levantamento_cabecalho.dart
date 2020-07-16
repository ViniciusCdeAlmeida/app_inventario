import 'package:app_inventario/providers/levantamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Acoes {
  buscarLevantamentos,
  buscarLevantamento,
  buscarInventarios,
  buscarInventario,
  exluirLevantamentos,
  exluirLevantamento,
  enviaLevantamento,
  exluirInventarios,
  exluirInventario,
  enviaInventario,
  gerarArquivoBackup,
}

handleDemoAction(
  Acoes action,
  BuildContext context,
  int idOrganizacao,
  String conexao,
) {
  Future teste;
  switch (action) {
    case Acoes.buscarLevantamentos:
      print('1');
      teste = Provider.of<Levantamento>(context)
          .buscaLevantamento(idOrganizacao, conexao);
      print(teste);
      break;
    case Acoes.buscarLevantamento:
      break;
    case Acoes.buscarInventarios:
      break;
    case Acoes.buscarInventario:
      break;
    case Acoes.exluirLevantamentos:
      break;
    case Acoes.exluirLevantamento:
      break;
    case Acoes.exluirInventarios:
      break;
    case Acoes.exluirInventario:
      break;
    case Acoes.gerarArquivoBackup:
      break;
    case Acoes.enviaInventario:
      break;
    case Acoes.enviaLevantamento:
      break;
  }
}

// Especializar o widget PopupMenuItem
class AcoesLevantamento extends StatelessWidget {
  final String conexao;
  final int idOrganizacao;

  AcoesLevantamento(this.conexao, this.idOrganizacao);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Acoes>(
      onSelected: (value) {
        handleDemoAction(
          value,
          context,
          idOrganizacao,
          conexao,
        );
      },
      offset: Offset(0, 100),
      itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
        PopupMenuItem<Acoes>(
          // height: 10,
          child: Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.cloud_download),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Carregar Levantamentos'),
                ),
              ],
            ),
          ),
          value: Acoes.buscarLevantamentos,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          // height: 10,
          child: Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.save_alt),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Carregar Levantamento'),
                ),
              ],
            ),
          ),
          value: Acoes.buscarLevantamento,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          // height: 10,
          child: Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.delete),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Excluir Levantamentos'),
                ),
              ],
            ),
          ),
          value: Acoes.exluirLevantamentos,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.delete_outline),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Excluir Levantamento'),
                ),
              ],
            ),
          ),
          value: Acoes.exluirLevantamentos,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.cloud_upload),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Enviar Levantamentos'),
                ),
              ],
            ),
          ),
          value: Acoes.enviaLevantamento,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.content_copy),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Gerar arquivo de backup'),
                ),
              ],
            ),
          ),
          value: Acoes.gerarArquivoBackup,
        ),
      ],
    );
  }
}
