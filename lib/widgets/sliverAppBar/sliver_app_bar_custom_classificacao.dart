import 'package:GRPInventario/providers/stores/index_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SliverAppBarCustomClassificacao extends StatefulWidget {
  final String tipoMenu;
  final Function ordenacao;
  final int limpaSelecionado;

  SliverAppBarCustomClassificacao({
    this.tipoMenu,
    this.ordenacao,
    this.limpaSelecionado,
  });

  @override
  _SliverAppBarCustomClassificacaoState createState() =>
      _SliverAppBarCustomClassificacaoState();
}

class _SliverAppBarCustomClassificacaoState
    extends State<SliverAppBarCustomClassificacao> {
  SliverAppBarCustomClassificacaoStore _sliverAppBarCustomClassificacaoStore;
  int valSelecionado;

  Widget radioMenu() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.height / 5,
      child: Observer(
        builder: (_) => ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount:
              _sliverAppBarCustomClassificacaoStore.dadosOrdenacao.length,
          itemBuilder: (_, idx) => Observer(
            builder: (_) => RadioListTile(
              title: Text(_sliverAppBarCustomClassificacaoStore
                  .dadosOrdenacao[idx]['nome']),
              groupValue: _sliverAppBarCustomClassificacaoStore.selecionado,
              value: int.parse(_sliverAppBarCustomClassificacaoStore
                  .dadosOrdenacao[idx]['tipo']),
              onChanged: (val) {
                _sliverAppBarCustomClassificacaoStore.selecionadoMenu(val);
                valSelecionado = val;
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _sliverAppBarCustomClassificacaoStore =
        Provider.of<SliverAppBarCustomClassificacaoStore>(context,
            listen: false);
    _sliverAppBarCustomClassificacaoStore.menuOrigem(widget.tipoMenu);
    _sliverAppBarCustomClassificacaoStore.atualMenu(widget.tipoMenu);
    Widget cancelarBtn = FlatButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuarBtn = FlatButton(
      child: const Text("OK"),
      onPressed: () {
        _sliverAppBarCustomClassificacaoStore
            .selecionadoMenu(_sliverAppBarCustomClassificacaoStore.selecionado);
        Navigator.of(context).pop();
        widget.ordenacao(_sliverAppBarCustomClassificacaoStore.selecionado);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Ordenar por:"),
      content: radioMenu(),
      actions: [
        cancelarBtn,
        continuarBtn,
      ],
    );
    return alert;
  }
}
