import 'package:app_inventario/customizacoes/acoes.dart';
// import 'package:app_inventario/customizacoes/estagios.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> refreshProd2(
    BuildContext context, String conexao, int id, Acoes acoes) async {
  switch (acoes) {
    case Acoes.buscarLevantamentos:
      await Provider.of<Levantamentos>(context).buscaLevantamento(id, conexao);
      // this.levantamentosLista =
      Provider.of<Levantamentos>(context).levantamentos;
      // _estagio = Estagios.FINALIZADO;
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
  }
}
