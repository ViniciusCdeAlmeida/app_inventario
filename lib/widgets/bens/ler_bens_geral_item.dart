import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/dominioProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class LerBensGeralTela extends StatefulWidget {
  static const routeName = '/LerBensGeralTela';

  @override
  _LerBensGeralTelaState createState() => _LerBensGeralTelaState();
}

class _LerBensGeralTelaState extends State<LerBensGeralTela> {
  var _expanded = false;
  final _numeroNovoFocusNode = FocusNode();
  final _numeroAntigoFocusNode = FocusNode();
  final _numeroAtualFocusNode = FocusNode();
  final _materialFocusNode = FocusNode();
  final _materialDescricaoFocusNode = FocusNode();
  final _situacaoFisicaFocusNode = FocusNode();
  final _statusBemFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  DadosBensPatrimoniais _item;
  bool _novoNumeroPatrimonial = false;
  Dominio _itemSelecionado;
  List<int> dropdownValues = [];
  Dominio teste1;

  List<Dominio> _dominiosInicial = [];

  var _edicaoBemInvent = InventarioBemPatrimonial(
    id: null,
    caracteristicas: null,
    dominioSituacaoFisica: null,
    dominioStatus: null,
    dominioStatusInventarioBem: null,
    idDadosBemPatrimonialMobile: null,
    idInventarioEstruturaOrganizacionalMobile: null,
    material: null,
    nomeUsuarioColeta: null,
    novoBemInvetariado: false,
    numeroPatrimonial: null,
    numeroPatrimonialAntigo: null,
    numeroPatrimonialNovo: null,
    tipoMobile: 'levantamentoFisico',
    bemNaoEncontrado: false,
    bemNaoInventariado: false,
  );

  var _valoresIniciais = {
    'descricao': null,
    'caracteristicas': null,
    'dominioSituacaoFisica': null,
    'dominioStatus': null,
    'dominioStatusInventarioBem': null,
    'idDadosBemPatrimonialMobile': null,
    'idInventarioEstruturaOrganizacionalMobile': null,
    'material': null,
    'nomeUsuarioColeta': null,
    'novoBemInvetariado': null,
    'numeroPatrimonial': null,
    'numeroPatrimonialAntigo': null,
    'numeroPatrimonialNovo': null,
    'tipoMobile': 'levantamentoFisico',
    'bemNaoEncontrado': false,
    'bemNaoInventariado': false,
  };

  @override
  void initState() {
    super.initState();
  }

  var _inicial = true;

  @override
  void didChangeDependencies() {
    final idBem = ModalRoute.of(context).settings.arguments;
    if (_inicial) {
      _item = Provider.of<EstruturaLevantamento>(context, listen: false)
          .buscaBensPorid(idBem);
      dropdownValues = List.generate(
          _item.bemPatrimonial.caracteristicas.length, (value) => 1);
      // _valoresIniciais = {
      //   'url': _edicaoBemInvent.url,
      //   'nome': _edicaoBemInvent.nome,
      //   'ativo': _edicaoBemInvent.ativo,
      // };
    }
    _inicial = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _numeroNovoFocusNode.dispose();
    _numeroAntigoFocusNode.dispose();
    _numeroAtualFocusNode.dispose();
    _materialFocusNode.dispose();
    _materialDescricaoFocusNode.dispose();
    _situacaoFisicaFocusNode.dispose();
    _statusBemFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _dominiosInicial =
        Provider.of<DominioProvier>(context, listen: false).getDominiosMarca;
    List<DropdownMenuItem<Dominio>> _dominiosT = _dominiosInicial.map(
      (itens) {
        return DropdownMenuItem(
          value: itens,
          child: Text(itens.descricao),
        );
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item: ${_item.numeroPatrimonial}',
          style: TextStyle(fontSize: 15),
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              Text(_item.material.codigoEDescricao),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                child: TextFormField(
                  key: Key('numeroPatrimonialText'),
                  initialValue: _item.bemPatrimonial.numeroPatrimonial,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    labelText: 'Numero Patrimonial',
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_numeroAtualFocusNode);
                  },
                  onSaved: (value) {
                    _edicaoBemInvent = InventarioBemPatrimonial(
                      numeroPatrimonial: value,
                      id: _edicaoBemInvent.id,
                      caracteristicas: _edicaoBemInvent.caracteristicas,
                      dominioSituacaoFisica:
                          _edicaoBemInvent.dominioSituacaoFisica,
                      dominioStatus: _edicaoBemInvent.dominioStatus,
                      dominioStatusInventarioBem:
                          _edicaoBemInvent.dominioStatusInventarioBem,
                      idDadosBemPatrimonialMobile:
                          _edicaoBemInvent.idDadosBemPatrimonialMobile,
                      idInventarioEstruturaOrganizacionalMobile:
                          _edicaoBemInvent
                              .idInventarioEstruturaOrganizacionalMobile,
                      material: _edicaoBemInvent.material,
                      numeroPatrimonialAntigo:
                          _edicaoBemInvent.numeroPatrimonialAntigo,
                      numeroPatrimonialNovo:
                          _edicaoBemInvent.numeroPatrimonialNovo,
                      tipoMobile: 'levantamentoFisico',
                      bemNaoEncontrado: false,
                      bemNaoInventariado: false,
                    );
                  },
                ),
              ),
              // Divider(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Adicionar um novo número patrimonial?"),
                    Checkbox(
                      value: _novoNumeroPatrimonial,
                      onChanged: (value) {
                        setState(
                          () {
                            _novoNumeroPatrimonial = value;
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              _novoNumeroPatrimonial == true
                  ? TextFormField(
                      key: Key('numeroPatrimonialNovoText'),
                      initialValue: _valoresIniciais['numeroPatrimonialNovo'],
                      decoration: InputDecoration(
                        labelText: 'Numero Patrimonial Novo',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_numeroNovoFocusNode);
                      },
                      onSaved: (value) {
                        _edicaoBemInvent = InventarioBemPatrimonial(
                          numeroPatrimonial: _edicaoBemInvent.numeroPatrimonial,
                          id: _edicaoBemInvent.id,
                          caracteristicas: _edicaoBemInvent.caracteristicas,
                          dominioSituacaoFisica:
                              _edicaoBemInvent.dominioSituacaoFisica,
                          dominioStatus: _edicaoBemInvent.dominioStatus,
                          dominioStatusInventarioBem:
                              _edicaoBemInvent.dominioStatusInventarioBem,
                          idDadosBemPatrimonialMobile:
                              _edicaoBemInvent.idDadosBemPatrimonialMobile,
                          idInventarioEstruturaOrganizacionalMobile:
                              _edicaoBemInvent
                                  .idInventarioEstruturaOrganizacionalMobile,
                          material: _edicaoBemInvent.material,
                          numeroPatrimonialAntigo:
                              _edicaoBemInvent.numeroPatrimonialAntigo,
                          numeroPatrimonialNovo: value,
                          tipoMobile: 'levantamentoFisico',
                          bemNaoEncontrado: false,
                          bemNaoInventariado: false,
                        );
                      },
                    )
                  : Container(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Caracteristicas'),
                      IconButton(
                        icon: Icon(
                            (_expanded ? Icons.expand_less : Icons.expand_more),
                            color: Colors.black),
                        onPressed: () {
                          setState(
                            () {
                              _expanded = !_expanded;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  if (_expanded)
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _item.bemPatrimonial.caracteristicas.length,
                        itemBuilder: (_, idx) {
                          Dominio itemAtual = _dominiosInicial.firstWhere(
                              (element) =>
                                  element.id.toString() ==
                                  _item.bemPatrimonial.caracteristicas[idx]
                                      .valorMaterialCaracteristica,
                              orElse: () => null);
                          return _item
                                      .bemPatrimonial
                                      .caracteristicas[idx]
                                      .materialCaracteristica
                                      .caracteristica
                                      .dominioTipoDado
                                      .nome !=
                                  'TEXT_FIELD'
                              ? SearchableDropdown.single(
                                  searchFn: (String keyword, _dominiosT) {
                                    List<int> ret = List<int>();
                                    if (keyword != null &&
                                        _dominiosT != null &&
                                        keyword.isNotEmpty) {
                                      keyword.split(" ").forEach((k) {
                                        int i = 0;
                                        _dominiosInicial.forEach((item) {
                                          if (k.isNotEmpty &&
                                              (item.descricao
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(k.toLowerCase()))) {
                                            ret.add(i);
                                          }
                                          i++;
                                        });
                                      });
                                    }
                                    if (keyword.isEmpty) {
                                      ret = Iterable<int>.generate(
                                              _dominiosT.length)
                                          .toList();
                                    }
                                    return (ret);
                                  },
                                  items: _dominiosT,
                                  value: itemAtual,
                                  isExpanded: true,
                                  dialogBox: true,
                                  onChanged: (novoItemSelecionado) {
                                    setState(
                                      () {
                                        teste1 = novoItemSelecionado;
                                        itemAtual = novoItemSelecionado;
                                      },
                                    );
                                  },
                                )
                              : Container();
                        },
                      ),
                    ),
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Flexible(
//   fit: FlexFit.loose,
//   child: ListView.builder(
//     shrinkWrap: true,
//     itemCount:
//         bemPatrimonial.bemPatrimonial.caracteristicas.length,
//     itemBuilder: (_, index) =>
//         DropdownButtonFormField<dynamic>(
//       value: bemPatrimonial
//           .bemPatrimonial.caracteristicas[index],
//       items: bemPatrimonial.bemPatrimonial.caracteristicas
//           .map((itens) {
//         return DropdownMenuItem(
//           value: _dominiosInicial
//               .where((element) =>
//                   element.chave ==
//                   itens.materialCaracteristica.caracteristica
//                       .chaveDominio)
//               .toList(),
//           child: Text(itens.valorMaterialCaracteristica),
//         );
//       }).toList(),
//       onChanged: (novoItemSelecionado) {
//         setState(() {
//           _itemSelecionado = novoItemSelecionado;
//         });
//       },
//     ),
//   ),
// ),

// void onDropDownChange(dropDownIndex, value) {
//     setState(() {
//       dropdownValues[dropDownIndex] = value;
//     });
//     print('onDropDownChange: $dropDownIndex -> $value');
//   }

// List.generate(
//                     bemPatrimonial.bemPatrimonial.caracteristicas.length,
//                     (index) {
//                       return Container(
//                         child: DropdownButton(
//                             isExpanded: true,
//                             onChanged: (value) =>
//                                 onDropDownChange(index, value),
//                             value: bemPatrimonial
//                                 .bemPatrimonial.caracteristicas[index],
//                             items: bemPatrimonial.bemPatrimonial.caracteristicas
//                                 .map((list) {
//                               return DropdownMenuItem(
//                                 child:
//                                     Text('${list.valorMaterialCaracteristica}'),
//                                 value: list,
//                               );
//                             }).toList()),
//                       );
//                     },
//                   ),

// SearchableDropdown.single(
//   value: bemPatrimonial.bemPatrimonial.caracteristicas
//       .map((itens) => itens.valorMaterialCaracteristica),
//   items: _dominiosInicial.map(
//     (Dominio itens) {
//       return DropdownMenuItem(
//         value: itens,
//         child: Text(itens.descricao),
//       );
//     },
//   ).toList(),
//   onChanged: (novoItemSelecionado) {
//     setState(
//       () {
//         _itemSelecionado = novoItemSelecionado;
//       },
//     );
//   },
// ),

//   FittedBox(
//     child: DropdownButton<Dominio>(
//       value: _itemSelecionado,
//       items: _dominiosInicial.map((Dominio itens) {
//         return DropdownMenuItem(
//           value: itens,
//           child: Text(itens.descricao),
//         );
//       }).toList(),
// onChanged: (novoItemSelecionado) {
//   setState(() {
//     _itemSelecionado = novoItemSelecionado;
//   });
//       },
//     ),
//   ),
// ],

// Column(
//   children: [
//     ListView.builder(
//       itemCount: bemPatrimonial.bemPatrimonial.caracteristicas.length,
//       itemBuilder: (_, index) => DropdownButtonFormField<MaterialCaracteristica>(
//         value: bemPatrimonial.bemPatrimonial.caracteristicas[index].materialCaracteristica,
//         items: bemPatrimonial.bemPatrimonial.caracteristicas.map((itens) {
//           return DropdownMenuItem(
//             value: itens.materialCaracteristica,
//             child: Text(itens.),
//           );
//         }).toList(),
//         onChanged: (novoItemSelecionado) {
//           setState(() {
//             // _itemSelecionado = novoItemSelecionado;
//           });
//         },
//       ),
//     ),
//   ],
// ),
// ),
