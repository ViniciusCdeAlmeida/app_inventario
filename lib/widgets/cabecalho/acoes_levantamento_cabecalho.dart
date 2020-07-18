import 'package:app_inventario/customizacoes/estagios.dart';
import 'package:app_inventario/screens/inventario/levantamentoFisico/levantamento_fisico_tela.dart';
import 'package:flutter/material.dart';
import '../../customizacoes/acoes.dart';
import 'package:app_inventario/customizacoes/handleAction.dart';
import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';

// Especializar o widget PopupMenuItem
class AcoesLevantamento extends StatefulWidget {
  final String conexao;
  final int idOrganizacao;

  AcoesLevantamento(this.conexao, this.idOrganizacao);

  @override
  _AcoesLevantamentoState createState() => _AcoesLevantamentoState();
}

class _AcoesLevantamentoState extends State<AcoesLevantamento> {
  Estagios estagio;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Acoes>(
      onSelected: (value) {
        setState(() {
          LevantamentoFisicoTela();
          estagio = Estagios.CARREGANDO;
          handleAction(
            value,
            context,
            widget.conexao,
          );
        });
        estagio = Estagios.FINALIZADO;
      },
      offset: Offset(0, 100),
      itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
        PopupMenuItem<Acoes>(
          child:
              PopupMenuCustom('Carregar Levantamentos', Icons.cloud_download),
          value: Acoes.buscarLevantamentos,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Carregar Levantamento', Icons.save_alt),
          value: Acoes.buscarLevantamento,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Excluir Levantamentos', Icons.delete),
          value: Acoes.exluirLevantamentos,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Excluir Levantamento', Icons.delete_outline),
          value: Acoes.exluirLevantamento,
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Acoes>(
          child: PopupMenuCustom('Enviar Levantamentos', Icons.cloud_upload),
          value: Acoes.enviaLevantamento,
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
