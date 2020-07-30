import 'package:app_inventario/customizacoes/acoes.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';
import 'package:app_inventario/screens/bens/previstos_bens_tela.dart';
import 'package:app_inventario/widgets/bens/ler_bens_item.dart';
import 'package:app_inventario/widgets/customizados/popupMenu_custom.dart';
import 'package:flutter/material.dart';

class UnidadeItem extends StatefulWidget {
  final EstruturaInventarioNew unidade;

  UnidadeItem(this.unidade);

  @override
  _UnidadeItemState createState() => _UnidadeItemState();
}

class _UnidadeItemState extends State<UnidadeItem> {
  var _expanded = false;

  void _redirecionamento(Acoes acoes, int idEstrutura) {
    switch (acoes) {
      case Acoes.lerBens:
        Navigator.of(context)
            .pushNamed(LerBensItens.routeName, arguments: idEstrutura);
        break;
      case Acoes.bensPrevistos:
        Navigator.of(context)
            .pushNamed(PrevistosBensTela.routeName, arguments: idEstrutura);
        break;
      case Acoes.estatisticas:
        print(idEstrutura);
        print('3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: widget.unidade.dominioStatusInventarioEstrutura != null &&
                widget.unidade.dominioStatusInventarioEstrutura.descricao ==
                    "Tratada"
            ? Colors.brown[200]
            : Colors.white,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            FittedBox(
              child: SizedBox(
                // height: 100,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ListTile(
                            // contentPadding:
                            //     EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            // leading: IconButton(
                            //   icon: Icon(
                            //       (_expanded
                            //           ? Icons.expand_less
                            //           : Icons.expand_more),
                            //       color: Colors.black),
                            //   onPressed: () {
                            //     setState(() {
                            //       _expanded = !_expanded;
                            //     });
                            //   },
                            // ),
                            trailing:
                                // PopupMenuTheme(data: null)
                                PopupMenuButton<Acoes>(
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                              onSelected: (value) {
                                _redirecionamento(value,
                                    widget.unidade.estruturaOrganizacional.id);
                              },
                              offset: Offset(0, 100),
                              itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                                PopupMenuItem<Acoes>(
                                  child: PopupMenuCustom(
                                      'Ler Bens', Icons.visibility),
                                  value: Acoes.lerBens,
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<Acoes>(
                                  child: PopupMenuCustom(
                                      'Bens Previstos', Icons.content_paste),
                                  value: Acoes.bensPrevistos,
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<Acoes>(
                                  child: PopupMenuCustom(
                                      'Estatisticas', Icons.equalizer),
                                  value: Acoes.estatisticas,
                                ),
                              ],
                            ),
                            title: Text(
                              widget
                                  .unidade.estruturaOrganizacional.codigoENome,
                              style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      // widget.unidade.statusEstrutura ==
                                      //         "Tratada"
                                      //     ? Colors.white
                                      //     :
                                      Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // if (_expanded)
            //   Container(
            //     padding: EdgeInsets.all(20),
            //     child: Row(
            //       children: <Widget>[
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             // widget.unidade.dataAdicao != null
            //             //     ? Text(
            //             //         'Data de Adição: ${widget.unidade.dataAdicao}')
            //             //     : Text(
            //             //         'Data de Adição: ${widget.unidade.dataEspelho}'),
            //             widget.unidade.dominioStatusInventarioEstrutura != null
            //                 ? Text(widget.unidade
            //                     .dominioStatusInventarioEstrutura.descricao)
            //                 : Text('Sem status'),
            //             Text(
            //                 'Qtde. de bens previstos: ${widget.unidade.estruturaOrganizacional.id}'),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
