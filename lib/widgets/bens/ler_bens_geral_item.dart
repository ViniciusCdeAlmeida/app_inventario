// import 'package:flutter/material.dart';

// class LerBensGeralItem extends StatefulWidget {
//   @override
//   LerBensGeralItemState createState() => LerBensGeralItemState();
// }

// class LerBensGeralItemState extends State<LerBensGeralItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//           key: _form,
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: Text('Descrição: ' + _item.material.codigoEDescricao),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   key: Key('numeroPatrimonialText'),
//                   enabled: false,
//                   initialValue: _item.bemPatrimonial.numeroPatrimonial,
//                   textAlignVertical: TextAlignVertical.bottom,
//                   decoration: InputDecoration(
//                     labelText: 'Numero Patrimonial',
//                     border: OutlineInputBorder(),
//                   ),
//                   textInputAction: TextInputAction.next,
//                   onFieldSubmitted: (_) {
//                     FocusScope.of(context).requestFocus(_numeroAtualFocusNode);
//                   },
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         border: Border.all(width: 1, color: Colors.grey[500]),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(4),
//                         ),
//                       ),
//                       child: SearchableDropdown.single(
//                         label: Text('Situação fisica'),
//                         isExpanded: true,
//                         dialogBox: true,
//                         displayClearIcon: false,
//                         readOnly: _item.inventariado,
//                         iconDisabledColor: Colors.black,
//                         value: Provider.of<Inicializacao>(context)
//                             .getDominiosBens(_item.dominioSituacaoFisica.chave)
//                             .firstWhere((element) =>
//                                 element.id == _item.dominioSituacaoFisica.id),
//                         items: Provider.of<Inicializacao>(context)
//                             .getDominiosDropdownBens(
//                                 _item.dominioSituacaoFisica.chave),
//                         onChanged: (novoItemSelecionado) {
//                           setState(
//                             () {
//                               _edicaoBemInvent.dominioSituacaoFisica =
//                                   novoItemSelecionado;
//                               _item.dominioSituacaoFisica = novoItemSelecionado;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         border: Border.all(width: 1, color: Colors.grey[500]),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5),
//                         ),
//                       ),
//                       child: SearchableDropdown.single(
//                         label: Text('Status'),
//                         isExpanded: true,
//                         dialogBox: true,
//                         displayClearIcon: false,
//                         readOnly: _item.inventariado,
//                         iconDisabledColor: Colors.black,
//                         value: Provider.of<Inicializacao>(context)
//                             .getDominiosBens(_item.dominioStatus.chave)
//                             .firstWhere((element) =>
//                                 element.id == _item.dominioStatus.id),
//                         items: Provider.of<Inicializacao>(context)
//                             .getDominiosDropdownBens(_item.dominioStatus.chave),
//                         onChanged: (novoItemSelecionado) {
//                           setState(
//                             () {
//                               _edicaoBemInvent.dominioStatus =
//                                   novoItemSelecionado;
//                               _item.dominioStatus = novoItemSelecionado;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     border: Border.all(width: 1, color: Colors.grey[500]),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(4),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Adicionar um novo número patrimonial?"),
//                       Checkbox(
//                         value: _novoNumeroPatrimonial,
//                         onChanged: (value) {
//                           setState(
//                             () {
//                               _novoNumeroPatrimonial = value;
//                             },
//                           );
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               _novoNumeroPatrimonial == true
//                   ? Container(
//                       padding: const EdgeInsets.all(10),
//                       child: TextFormField(
//                         key: Key('numeroPatrimonialNovoText'),
//                         initialValue: null,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Numero Patrimonial Novo',
//                         ),
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         onFieldSubmitted: (_) {
//                           FocusScope.of(context)
//                               .requestFocus(_numeroNovoFocusNode);
//                         },
//                         onSaved: (value) {
//                           _edicaoBemInvent.numeroPatrimonialNovo =
//                               _digitoVerificador + value;
//                         },
//                         maxLength: _digitos == null ? null : _digitos.length,
//                       ),
//                     )
//                   : Container(),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     border: Border.all(width: 1, color: Colors.grey[500]),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(4),
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   child: Flex(
//                     direction: Axis.vertical,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Caracteristicas'),
//                           IconButton(
//                             icon: Icon(
//                                 (_expanded
//                                     ? Icons.expand_less
//                                     : Icons.expand_more),
//                                 color: Colors.black),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _expanded = !_expanded;
//                                 },
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       if (_expanded)
//                         Flexible(
//                           fit: FlexFit.loose,
//                           child: ListView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount:
//                                 _item.bemPatrimonial.caracteristicas.length,
//                             itemBuilder: (_, idx) {
//                               List<DropdownMenuItem<Dominio>>
//                                   _dominiosDropdownAtual =
//                                   Provider.of<Inicializacao>(context)
//                                       .getDominiosDropdownBens(_item
//                                           .bemPatrimonial
//                                           .caracteristicas[idx]
//                                           .materialCaracteristica
//                                           .caracteristica
//                                           .chaveDominio);
//                               Dominio itemAtual =
//                                   Provider.of<Inicializacao>(context)
//                                       .getDominiosBens(_item
//                                           .bemPatrimonial
//                                           .caracteristicas[idx]
//                                           .materialCaracteristica
//                                           .caracteristica
//                                           .chaveDominio)
//                                       .firstWhere(
//                                           (element) =>
//                                               element.id.toString() ==
//                                               _item
//                                                   .bemPatrimonial
//                                                   .caracteristicas[idx]
//                                                   .valorMaterialCaracteristica,
//                                           orElse: () => null);
//                               return _item
//                                           .bemPatrimonial
//                                           .caracteristicas[idx]
//                                           .materialCaracteristica
//                                           .caracteristica
//                                           .dominioTipoDado
//                                           .nome ==
//                                       'TIPO_DOMINIO'
//                                   ? Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: SearchableDropdown.single(
//                                         readOnly: _item.inventariado,
//                                         iconDisabledColor: Colors.black,
//                                         label: _item
//                                             .bemPatrimonial
//                                             .caracteristicas[idx]
//                                             .materialCaracteristica
//                                             .caracteristica
//                                             .descricao,
//                                         searchFn: (String keyword,
//                                             _dominiosDropdownAtual) {
//                                           List<int> ret = List<int>();
//                                           if (keyword != null &&
//                                               _dominiosDropdownAtual != null &&
//                                               keyword.isNotEmpty) {
//                                             keyword.split(" ").forEach((k) {
//                                               int i = 0;
//                                               _dominiosInicial.forEach((item) {
//                                                 if (k.isNotEmpty &&
//                                                     (item.descricao
//                                                         .toString()
//                                                         .toLowerCase()
//                                                         .contains(
//                                                             k.toLowerCase()))) {
//                                                   ret.add(i);
//                                                 }
//                                                 i++;
//                                               });
//                                             });
//                                           }
//                                           if (keyword.isEmpty) {
//                                             ret = Iterable<int>.generate(
//                                                     _dominiosDropdownAtual
//                                                         .length)
//                                                 .toList();
//                                           }
//                                           return (ret);
//                                         },
//                                         items: _dominiosDropdownAtual,
//                                         value: itemAtual,
//                                         hint: _item
//                                             .bemPatrimonial
//                                             .caracteristicas[idx]
//                                             .materialCaracteristica
//                                             .caracteristica
//                                             .descricao,
//                                         isExpanded: true,
//                                         onChanged: (itemSelecionado) {
//                                           setState(
//                                             () {
//                                               _edicaoBemInvent
//                                                       .caracteristicas[idx]
//                                                       .valorMaterialCaracteristica =
//                                                   itemSelecionado == null
//                                                       ? null
//                                                       : itemSelecionado.id
//                                                           .toString();
//                                             },
//                                           );
//                                         },
//                                       ),
//                                     )
//                                   : _item
//                                               .bemPatrimonial
//                                               .caracteristicas[idx]
//                                               .materialCaracteristica
//                                               .caracteristica
//                                               .dominioTipoDado
//                                               .nome ==
//                                           'TEXT_FIELD'
//                                       ? Container(
//                                           padding: EdgeInsets.all(10),
//                                           child: TextFormField(
//                                             key: Key('numeroPatrimonialText'),
//                                             enabled: _item.inventariado == true
//                                                 ? false
//                                                 : true,
//                                             initialValue: _item
//                                                 .bemPatrimonial
//                                                 .caracteristicas[idx]
//                                                 .valorMaterialCaracteristica,
//                                             textAlignVertical:
//                                                 TextAlignVertical.bottom,
//                                             decoration: InputDecoration(
//                                               labelText: _item
//                                                   .bemPatrimonial
//                                                   .caracteristicas[idx]
//                                                   .materialCaracteristica
//                                                   .caracteristica
//                                                   .descricao,
//                                               border: OutlineInputBorder(),
//                                             ),
//                                             onFieldSubmitted: (_) {
//                                               FocusScope.of(context)
//                                                   .requestFocus(
//                                                       _dropdownFocusNode);
//                                             },
//                                             onSaved: (value) {
//                                               _edicaoBemInvent
//                                                       .caracteristicas[idx]
//                                                       .valorMaterialCaracteristica =
//                                                   value == "" ? null : value;
//                                             },
//                                           ),
//                                         )
//                                       : Container();
//                             },
//                           ),
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//   }
// }
