import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';
import 'package:flutter/material.dart';

import 'package:app_inventario/customizacoes/acoes.dart';
import 'package:app_inventario/customizacoes/handleAction.dart';

class AcoesInventario extends StatelessWidget {
  final String conexao;
  final int idOrganizacao;

  AcoesInventario(this.conexao, this.idOrganizacao);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Acoes>(
      onSelected: (value) {
        CircularProgressIndicator();
        handleAction(
          value,
          context,
          conexao,
        );
      },
      offset: Offset(0, 100),
      itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Carregar Inventarios', Icons.cloud_download),
          value: Acoes.buscarInventarios,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Carregar Inventario', Icons.save_alt),
          value: Acoes.buscarInventario,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Exluir Inventarios', Icons.delete),
          value: Acoes.exluirInventarios,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Exluir Inventario', Icons.delete_outline),
          value: Acoes.exluirInventario,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Enviar Inventario', Icons.cloud_upload),
          value: Acoes.enviaInventario,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Gerar arquivo de backup', Icons.content_copy),
          value: Acoes.gerarArquivoBackup,
        ),
      ],
    );
  }
}
