import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/screens/unidade/unidade_tela.dart';
import 'package:app_inventario/widgets/unidade/unidade_item.dart';
import 'package:flutter/material.dart';

class LevantamentoFisicoItem extends StatefulWidget {
  final Levantamento levantamento;

  LevantamentoFisicoItem(
    this.levantamento,
  );
  @override
  _LevantamentoFisicoItemState createState() => _LevantamentoFisicoItemState();
}

class _LevantamentoFisicoItemState extends State<LevantamentoFisicoItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: IconButton(
              icon: Icon((_expanded ? Icons.expand_less : Icons.expand_more),
                  color: Colors.black),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
            subtitle: Text(widget.levantamento.codigo),
            title: Text(widget.levantamento.nome),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  UnidadeTela.routeName,
                  arguments: TelaArgumentos(
                    id: widget.levantamento.id,
                    arg1: widget.levantamento.nome,
                  ),
                );
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Data de Inicio: ${widget.levantamento.dataInicio}'),
                      Text(
                          'Qtde. estruturas: ${widget.levantamento.quantidadeEstruturas}'),
                      Text(
                          'Qtde. bens: ${widget.levantamento.quantidadeTotalBens}'),
                      Text(
                          'Objetivo: ${widget.levantamento.dominioStatusInventario.descricao}'),
                      // Text(
                      //     '${widget.levantamento.dominioTipoInventario.descricao}'),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
