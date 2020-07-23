import 'package:app_inventario/providers/autenticacao.dart';
import 'package:flutter/material.dart';

import './acoes.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:provider/provider.dart';

handleAction(
  Acoes action,
  BuildContext context,
  String conexao,
) {
  // 1 - fazer um widget para o espiral
  // 2 - redirecionar para um
  // 1 - fazer um widget para o espiral
  // 1 - fazer um widget para o espiral
  // 1 - fazer um widget para o espiral
  // Future teste;
  switch (action) {
    case Acoes.buscarLevantamentos:
      int idOrganizacao = Provider.of<Autenticacao>(context).idUnidade;
      Provider.of<Levantamentos>(context)
          .buscaLevantamento(idOrganizacao, conexao);
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
    case Acoes.buscarInventarios:
      print('6');
      break;
    case Acoes.buscarInventario:
      print('7');
      break;
    case Acoes.exluirInventarios:
      print('8');
      break;
    case Acoes.exluirInventario:
      print('9');
      break;
    case Acoes.enviaInventario:
      print('10');
      break;
    case Acoes.gerarArquivoBackup:
      print('11');
      break;
    default:
  }
}
