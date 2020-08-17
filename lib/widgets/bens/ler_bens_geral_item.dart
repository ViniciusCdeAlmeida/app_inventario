import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/dominioProvider.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/screens/bens/previstos_bens_tela.dart';
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
  final _dropdownFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  DadosBensPatrimoniais _item;
  bool _novoNumeroPatrimonial = false;
  var _isLoading = false;
  var _inicial = true;

  List<Dominio> _dominiosInicial = [];

  var _edicaoBemInvent = InventarioBemPatrimonial(
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

  @override
  void didChangeDependencies() {
    final idBem = ModalRoute.of(context).settings.arguments;
    final usuarioColetante =
        Provider.of<Autenticacao>(context, listen: false).usuarioLogado;
    if (_inicial) {
      _item = Provider.of<EstruturaLevantamento>(context, listen: false)
          .buscaBensPorid(idBem);
      if (_item.inventarioBemPatrimonial != null) {
        _item.inventariado = true;
      }
      _edicaoBemInvent.dominioSituacaoFisica = _item.dominioSituacaoFisica;
      _edicaoBemInvent.dominioStatus = _item.dominioStatus;
      _edicaoBemInvent.dominioStatusInventarioBem =
          _item.dominioStatusInventarioBem;
      _edicaoBemInvent.idDadosBemPatrimonialMobile = _item.id;
      _edicaoBemInvent.idInventarioEstruturaOrganizacionalMobile =
          _item.idInventarioEstruturaOrganizacional;
      _edicaoBemInvent.material = _item.material;
      _edicaoBemInvent.caracteristicas = _item.bemPatrimonial.caracteristicas;
      _edicaoBemInvent.nomeUsuarioColeta = usuarioColetante;
      _edicaoBemInvent.numeroPatrimonial =
          _item.bemPatrimonial.numeroPatrimonial;
      _edicaoBemInvent.numeroPatrimonialAntigo =
          _item.bemPatrimonial.numeroPatrimonial;
      _edicaoBemInvent.numeroPatrimonialAntigo =
          _item.bemPatrimonial.numeroPatrimonial;
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
    _dropdownFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    String conexao = Provider.of<Autenticacao>(context).atualConexao;
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_edicaoBemInvent.numeroPatrimonialNovo == null) {
      _edicaoBemInvent.numeroPatrimonialNovo =
          _edicaoBemInvent.numeroPatrimonial;
    }
    try {
      await Provider.of<InventarioBemPatrimonialProvider>(
        context,
        listen: false,
      ).salvaDados(_edicaoBemInvent, conexao);
      _item.inventariado = true;
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error!!!!'),
          content: Text(error.toString()),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    // Navigator.pushNamed(
    //   context,
    //   PrevistosBensTela.routeName,
    // );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _dominiosInicial =
        Provider.of<DominioProvier>(context, listen: false).getDominiosMarca;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item: ${_item.numeroPatrimonial}',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          if (!_item.inventariado)
            IconButton(
              icon: Icon(
                Icons.check,
              ),
              onPressed: () {
                _saveForm();
              },
            )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Descrição: ' + _item.material.codigoEDescricao),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  key: Key('numeroPatrimonialText'),
                  enabled: false,
                  initialValue: _item.bemPatrimonial.numeroPatrimonial,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    labelText: 'Numero Patrimonial',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_numeroAtualFocusNode);
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: Colors.grey[500]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: SearchableDropdown.single(
                        label: Text('Situação fisica'),
                        isExpanded: true,
                        dialogBox: true,
                        displayClearIcon: false,
                        readOnly: _item.inventariado,
                        iconDisabledColor: Colors.black,
                        value: Provider.of<DominioProvier>(context)
                            .getDominiosBens(_item.dominioSituacaoFisica.chave)
                            .firstWhere((element) =>
                                element.id == _item.dominioSituacaoFisica.id),
                        items: Provider.of<DominioProvier>(context)
                            .getDominiosDropdownBens(
                                _item.dominioSituacaoFisica.chave),
                        onChanged: (novoItemSelecionado) {
                          setState(
                            () {
                              _edicaoBemInvent.dominioSituacaoFisica =
                                  novoItemSelecionado;
                              _item.dominioSituacaoFisica = novoItemSelecionado;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: Colors.grey[500]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SearchableDropdown.single(
                        label: Text('Status'),
                        isExpanded: true,
                        dialogBox: true,
                        displayClearIcon: false,
                        readOnly: _item.inventariado,
                        iconDisabledColor: Colors.black,
                        value: Provider.of<DominioProvier>(context)
                            .getDominiosBens(_item.dominioStatus.chave)
                            .firstWhere((element) =>
                                element.id == _item.dominioStatus.id),
                        items: Provider.of<DominioProvier>(context)
                            .getDominiosDropdownBens(_item.dominioStatus.chave),
                        onChanged: (novoItemSelecionado) {
                          setState(
                            () {
                              _edicaoBemInvent.dominioStatus =
                                  novoItemSelecionado;
                              _item.dominioStatus = novoItemSelecionado;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey[500]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
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
              ),
              _novoNumeroPatrimonial == true
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        key: Key('numeroPatrimonialNovoText'),
                        initialValue: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero Patrimonial Novo',
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_numeroNovoFocusNode);
                        },
                        onSaved: (value) {
                          _edicaoBemInvent.numeroPatrimonialNovo = value;
                        },
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey[500]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Caracteristicas'),
                          IconButton(
                            icon: Icon(
                                (_expanded
                                    ? Icons.expand_less
                                    : Icons.expand_more),
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
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                _item.bemPatrimonial.caracteristicas.length,
                            itemBuilder: (_, idx) {
                              List<DropdownMenuItem<Dominio>>
                                  _dominiosDropdownAtual =
                                  Provider.of<DominioProvier>(context)
                                      .getDominiosDropdownBens(_item
                                          .bemPatrimonial
                                          .caracteristicas[idx]
                                          .materialCaracteristica
                                          .caracteristica
                                          .chaveDominio);
                              Dominio itemAtual =
                                  Provider.of<DominioProvier>(context)
                                      .getDominiosBens(_item
                                          .bemPatrimonial
                                          .caracteristicas[idx]
                                          .materialCaracteristica
                                          .caracteristica
                                          .chaveDominio)
                                      .firstWhere(
                                          (element) =>
                                              element.id.toString() ==
                                              _item
                                                  .bemPatrimonial
                                                  .caracteristicas[idx]
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
                                  ? Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SearchableDropdown.single(
                                        readOnly: _item.inventariado,
                                        iconDisabledColor: Colors.black,
                                        label: _item
                                            .bemPatrimonial
                                            .caracteristicas[idx]
                                            .materialCaracteristica
                                            .caracteristica
                                            .descricao,
                                        searchFn: (String keyword,
                                            _dominiosDropdownAtual) {
                                          List<int> ret = List<int>();
                                          if (keyword != null &&
                                              _dominiosDropdownAtual != null &&
                                              keyword.isNotEmpty) {
                                            keyword.split(" ").forEach((k) {
                                              int i = 0;
                                              _dominiosInicial.forEach((item) {
                                                if (k.isNotEmpty &&
                                                    (item.descricao
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(
                                                            k.toLowerCase()))) {
                                                  ret.add(i);
                                                }
                                                i++;
                                              });
                                            });
                                          }
                                          if (keyword.isEmpty) {
                                            ret = Iterable<int>.generate(
                                                    _dominiosDropdownAtual
                                                        .length)
                                                .toList();
                                          }
                                          return (ret);
                                        },
                                        items: _dominiosDropdownAtual,
                                        value: itemAtual,
                                        hint: _item
                                            .bemPatrimonial
                                            .caracteristicas[idx]
                                            .materialCaracteristica
                                            .caracteristica
                                            .descricao,
                                        isExpanded: true,
                                        onChanged: (itemSelecionado) {
                                          setState(
                                            () {
                                              _edicaoBemInvent
                                                      .caracteristicas[idx]
                                                      .valorMaterialCaracteristica =
                                                  itemSelecionado == null
                                                      ? null
                                                      : itemSelecionado.id
                                                          .toString();
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(10),
                                      child: TextFormField(
                                        key: Key('numeroPatrimonialText'),
                                        enabled: _item.inventariado == true
                                            ? false
                                            : true,
                                        initialValue: _item
                                            .bemPatrimonial
                                            .caracteristicas[idx]
                                            .valorMaterialCaracteristica,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                          labelText: _item
                                              .bemPatrimonial
                                              .caracteristicas[idx]
                                              .materialCaracteristica
                                              .caracteristica
                                              .descricao,
                                          border: OutlineInputBorder(),
                                        ),
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_dropdownFocusNode);
                                        },
                                        onSaved: (value) {
                                          _edicaoBemInvent.caracteristicas[idx]
                                                  .valorMaterialCaracteristica =
                                              value == "" ? null : value;
                                        },
                                      ),
                                    );
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
