import 'package:app_inventario/stores/bemPatrimonial_store.dart';
import 'package:app_inventario/stores/bensPrevistos_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/estruturaInventario.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/telaArgumentos.dart';

import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';

import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';

// ignore: must_be_immutable
class LerBensGeralTela extends StatefulWidget {
  static const routeName = '/LerBensGeralTela';
  int id;
  EstruturaInventario estrutura;

  LerBensGeralTela({this.id, this.estrutura});

  @override
  _LerBensGeralTelaState createState() => _LerBensGeralTelaState();
}

class _LerBensGeralTelaState extends State<LerBensGeralTela> {
  final _numeroNovoFocusNode = FocusNode();
  final _numeroAntigoFocusNode = FocusNode();
  final _numeroAtualFocusNode = FocusNode();
  final _materialFocusNode = FocusNode();
  final _materialDescricaoFocusNode = FocusNode();
  final _situacaoFisicaFocusNode = FocusNode();
  final _statusBemFocusNode = FocusNode();
  final _dropdownFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  bool _novoNumeroPatrimonial = false;
  String _qtdeDigitos;
  List<Dominio> _dominiosInicial = [];
  TelaArgumentos unidadeArgs;
  String _digitoVerificador;
  String _usuarioColetante;
  int _idAtuaUl;
  int _idOrganizacao;

  BemPatrimonialStore _bemPatrimonialStore;

  var _expanded = false;

  InventarioBemPatrimonial _edicaoBemInvent = InventarioBemPatrimonial(
    tipoMobile: 'levantamentoFisico',
    bemNaoEncontrado: false,
    bemNaoInventariado: false,
  );

  @override
  void didChangeDependencies() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    _bemPatrimonialStore =
        Provider.of<BemPatrimonialStore>(context, listen: false);
    _bemPatrimonialStore.buscaDominios();
    _idOrganizacao =
        Provider.of<Autenticacao>(context, listen: false).idUnidade;
    _idAtuaUl =
        Provider.of<EstruturaLevantamento>(context, listen: false).getUlAtual;
    _digitoVerificador =
        Provider.of<EstruturaLevantamento>(context, listen: false)
            .getDigitoVerificador;
    _usuarioColetante =
        Provider.of<Autenticacao>(context, listen: false).usuarioLogado;
    _qtdeDigitos = Provider.of<EstruturaLevantamento>(context, listen: false)
        .getDigitosLeitura;

    _bemPatrimonialStore.buscaBemPatrimonial(
        unidadeArgs.arg1, unidadeArgs.arg2, _idAtuaUl, unidadeArgs.arg3);
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
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    if (_edicaoBemInvent.numeroPatrimonialNovo == null &&
        _digitoVerificador != null) {
      _edicaoBemInvent.numeroPatrimonialNovo =
          _digitoVerificador + _edicaoBemInvent.numeroPatrimonial;
    } else {
      _edicaoBemInvent.numeroPatrimonialNovo =
          _edicaoBemInvent.numeroPatrimonial;
    }
    try {
      await Provider.of<InventarioBensPatrimoniais>(
        context,
        listen: false,
      ).gravaDados(_edicaoBemInvent);

      Provider.of<BensPrevistosStore>(
        context,
        listen: false,
      ).atualizaItem(_bemPatrimonialStore.bemPatrimonial.id);
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro. .'),
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

    Navigator.of(context).pop();
  }

  void _atribuiValores(BemPatrimonial bem) {
    if (bem != null) {
      unidadeArgs = ModalRoute.of(context).settings.arguments;

      if (bem.dadosBensPatrimoniais != null &&
          bem.dadosBensPatrimoniais.inventarioBemPatrimonial != null) {
        bem.dadosBensPatrimoniais.inventariado = true;
      }

      _edicaoBemInvent.dominioSituacaoFisica = bem.dominioSituacaoFisica;
      _edicaoBemInvent.dominioStatus = bem.dominioStatus;
      _edicaoBemInvent.dominioStatusInventarioBem =
          bem.dadosBensPatrimoniais != null
              ? bem.dadosBensPatrimoniais.dominioStatusInventarioBem
              : null;
      _edicaoBemInvent.idDadosBemPatrimonialMobile = bem.id;
      _edicaoBemInvent.idInventarioEstruturaOrganizacionalMobile =
          unidadeArgs.id;
      _edicaoBemInvent.material = bem.material;
      _edicaoBemInvent.caracteristicas = bem.caracteristicas;
      _edicaoBemInvent.nomeUsuarioColeta = _usuarioColetante;
      _edicaoBemInvent.numeroPatrimonial = bem.numeroPatrimonial;
      _edicaoBemInvent.numeroPatrimonialAntigo = bem.numeroPatrimonial;
      _edicaoBemInvent.idUnidadeOrganizacional = _idOrganizacao;
      _edicaoBemInvent.idDominioSituacaoFisica = bem.dominioSituacaoFisica.id;
      _edicaoBemInvent.idDominioStatus = bem.dominioStatus.id;
      _edicaoBemInvent.idEstruturaOrganizacionalAtual =
          bem.estruturaOrganizacionalAtual.id;
      _edicaoBemInvent.idMaterial = bem.material.id;

      _edicaoBemInvent.enviado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      // ignore: missing_return
      builder: (_) {
        switch (_bemPatrimonialStore.bemPatrimonialState) {
          case BemPatrimonialState.inicial:
          case BemPatrimonialState.carregando:
            return Scaffold(
              drawer: AppDrawer(),
              body: Center(
                child: Container(
                  height: 70,
                  child: Column(
                    children: [
                      const Text(
                        'Carregando...',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case BemPatrimonialState.carregado:
            _atribuiValores(_bemPatrimonialStore.bemPatrimonial);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Item: ${_bemPatrimonialStore.bemPatrimonial.numeroPatrimonial}',
                  style: TextStyle(fontSize: 15),
                ),
                actions: [
                  if (_bemPatrimonialStore
                              .bemPatrimonial.dadosBensPatrimoniais !=
                          null
                      ? !_bemPatrimonialStore
                          .bemPatrimonial.dadosBensPatrimoniais.inventariado
                      : !_bemPatrimonialStore.bemPatrimonial.inventariado)
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
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _form,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Descrição: ' +
                            _bemPatrimonialStore
                                .bemPatrimonial.material.codigoEDescricao),
                      ),
                      if (_idAtuaUl !=
                          _bemPatrimonialStore
                              .bemPatrimonial.estruturaOrganizacionalAtual.id)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Bem pertence a U.L.: ' +
                                _bemPatrimonialStore.bemPatrimonial
                                    .estruturaOrganizacionalAtual.nome,
                            style: TextStyle(color: Colors.red[800]),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          key: Key('numeroPatrimonialText'),
                          enabled: false,
                          initialValue: _bemPatrimonialStore
                              .bemPatrimonial.numeroPatrimonial,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            labelText: 'Numero Patrimonial',
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_numeroAtualFocusNode);
                          },
                        ),
                      ),
                      Column(
                        children: [
                          dropDownBemPatrimonial('Situação fisica',
                              _bemPatrimonialStore.bemPatrimonial),
                          dropDownBemPatrimonial(
                              'Status', _bemPatrimonialStore.bemPatrimonial),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1, color: Colors.grey[500]),
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
                                  _edicaoBemInvent.numeroPatrimonialNovo =
                                      _digitoVerificador + value;
                                },
                                maxLength: _qtdeDigitos == null
                                    ? null
                                    : _qtdeDigitos.length,
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1, color: Colors.grey[500]),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    itemCount: _bemPatrimonialStore
                                        .bemPatrimonial.caracteristicas.length,
                                    itemBuilder: (_, idx) {
                                      List<DropdownMenuItem<Dominio>>
                                          _dominiosDropdownAtual =
                                          _bemPatrimonialStore
                                              .filtroDominiosDropdownBens(
                                                  _bemPatrimonialStore
                                                      .bemPatrimonial
                                                      .caracteristicas[idx]
                                                      .materialCaracteristica
                                                      .caracteristica
                                                      .chaveDominio);
                                      Dominio itemAtual = _bemPatrimonialStore
                                          .filtroDominio(_bemPatrimonialStore
                                              .bemPatrimonial
                                              .caracteristicas[idx]
                                              .materialCaracteristica
                                              .caracteristica
                                              .chaveDominio)
                                          .firstWhere(
                                              (element) =>
                                                  element.id.toString() ==
                                                  _bemPatrimonialStore
                                                      .bemPatrimonial
                                                      .caracteristicas[idx]
                                                      .valorMaterialCaracteristica,
                                              orElse: () => null);
                                      return _bemPatrimonialStore
                                                  .bemPatrimonial
                                                  .caracteristicas[idx]
                                                  .materialCaracteristica
                                                  .caracteristica
                                                  .dominioTipoDado
                                                  .nome ==
                                              'TIPO_DOMINIO'
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: SearchableDropdown.single(
                                                readOnly: _bemPatrimonialStore
                                                            .bemPatrimonial
                                                            .dadosBensPatrimoniais !=
                                                        null
                                                    ? _bemPatrimonialStore
                                                        .bemPatrimonial
                                                        .dadosBensPatrimoniais
                                                        .inventariado
                                                    : _bemPatrimonialStore
                                                        .bemPatrimonial
                                                        .inventariado,
                                                iconDisabledColor: Colors.black,
                                                label: _bemPatrimonialStore
                                                    .bemPatrimonial
                                                    .caracteristicas[idx]
                                                    .materialCaracteristica
                                                    .caracteristica
                                                    .descricao,
                                                searchFn: (String keyword,
                                                    _dominiosDropdownAtual) {
                                                  List<int> ret = List<int>();
                                                  if (keyword != null &&
                                                      _dominiosDropdownAtual !=
                                                          null &&
                                                      keyword.isNotEmpty) {
                                                    keyword.split(" ").forEach(
                                                      (k) {
                                                        int i = 0;
                                                        _dominiosInicial
                                                            .forEach(
                                                          (item) {
                                                            if (k.isNotEmpty &&
                                                                (item.descricao
                                                                    .toString()
                                                                    .toLowerCase()
                                                                    .contains(k
                                                                        .toLowerCase()))) {
                                                              ret.add(i);
                                                            }
                                                            i++;
                                                          },
                                                        );
                                                      },
                                                    );
                                                  }
                                                  if (keyword.isEmpty) {
                                                    ret = Iterable<
                                                                int>.generate(
                                                            _dominiosDropdownAtual
                                                                .length)
                                                        .toList();
                                                  }
                                                  return (ret);
                                                },
                                                items: _dominiosDropdownAtual,
                                                value: itemAtual,
                                                hint: _bemPatrimonialStore
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
                                                          (itemSelecionado ==
                                                                  null
                                                              ? null
                                                              : itemSelecionado
                                                                  .id
                                                                  .toString());
                                                    },
                                                  );
                                                },
                                              ),
                                            )
                                          : _bemPatrimonialStore
                                                      .bemPatrimonial
                                                      .caracteristicas[idx]
                                                      .materialCaracteristica
                                                      .caracteristica
                                                      .dominioTipoDado
                                                      .nome ==
                                                  'TEXT_FIELD'
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: TextFormField(
                                                    key: Key(
                                                        'numeroPatrimonialText'),
                                                    enabled: _bemPatrimonialStore
                                                                .bemPatrimonial
                                                                .inventariado ==
                                                            true
                                                        ? false
                                                        : true,
                                                    initialValue:
                                                        _bemPatrimonialStore
                                                            .bemPatrimonial
                                                            .caracteristicas[
                                                                idx]
                                                            .valorMaterialCaracteristica,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          _bemPatrimonialStore
                                                              .bemPatrimonial
                                                              .caracteristicas[
                                                                  idx]
                                                              .materialCaracteristica
                                                              .caracteristica
                                                              .descricao,
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    onFieldSubmitted: (_) {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _dropdownFocusNode);
                                                    },
                                                    onSaved: (value) {
                                                      _edicaoBemInvent
                                                              .caracteristicas[idx]
                                                              .valorMaterialCaracteristica =
                                                          value == ""
                                                              ? null
                                                              : value;
                                                    },
                                                  ),
                                                )
                                              : Container();
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
      },
    );
  }

  Widget dropDownBemPatrimonial(String label, BemPatrimonial bem) {
    Dominio dropdownDominio;
    List<DropdownMenuItem<Dominio>> dropdownDominioItens;
    if (label == 'Situação fisica') {
      dropdownDominio = _bemPatrimonialStore
          .filtroDominio(bem.dadosBensPatrimoniais != null &&
                  bem.dadosBensPatrimoniais.dominioSituacaoFisica != null
              ? bem.dadosBensPatrimoniais.dominioSituacaoFisica.chave
              : bem.dominioSituacaoFisica.chave)
          .firstWhere(
            (element) =>
                element.id ==
                (bem.dadosBensPatrimoniais != null &&
                        bem.dadosBensPatrimoniais.dominioSituacaoFisica != null
                    ? bem.dadosBensPatrimoniais.dominioSituacaoFisica.id
                    : bem.dominioSituacaoFisica.id),
          );
      dropdownDominioItens = _bemPatrimonialStore
          .filtroDominiosDropdownBens(bem.dominioSituacaoFisica.chave);
    } else if (label == 'Status') {
      dropdownDominio = _bemPatrimonialStore
          .filtroDominio(bem.dadosBensPatrimoniais != null &&
                  bem.dadosBensPatrimoniais.dominioStatus != null
              ? bem.dadosBensPatrimoniais.dominioStatus.chave
              : bem.dominioStatus.chave)
          .firstWhere(
            (element) =>
                element.id ==
                (bem.dadosBensPatrimoniais != null &&
                        bem.dadosBensPatrimoniais.dominioStatus != null
                    ? bem.dadosBensPatrimoniais.dominioStatus.id
                    : bem.dominioStatus.id),
          );
      dropdownDominioItens = _bemPatrimonialStore
          .filtroDominiosDropdownBens(bem.dominioStatus.chave);
    }
    return Padding(
      padding: const EdgeInsets.all(10),
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
          label: Text(label),
          isExpanded: true,
          dialogBox: true,
          displayClearIcon: false,
          readOnly: bem.dadosBensPatrimoniais != null
              ? bem.dadosBensPatrimoniais.inventariado
              : bem.inventariado,
          iconDisabledColor: Colors.black,
          value: dropdownDominio,
          items: dropdownDominioItens,
          onChanged: (novoItemSelecionado) {
            if (mounted) {
              setState(
                () {
                  if (label == 'Situação fisica') {
                    _edicaoBemInvent.dominioSituacaoFisica =
                        novoItemSelecionado;
                    _edicaoBemInvent.idDominioSituacaoFisica =
                        novoItemSelecionado.id;
                    bem.dominioSituacaoFisica = novoItemSelecionado;
                    if (bem.dadosBensPatrimoniais != null)
                      bem.dadosBensPatrimoniais.dominioSituacaoFisica =
                          novoItemSelecionado;
                  } else if (label == 'Status') {
                    _edicaoBemInvent.dominioStatus = novoItemSelecionado;
                    _edicaoBemInvent.idDominioStatus = novoItemSelecionado.id;
                    bem.dominioStatus = novoItemSelecionado;
                    if (bem.dadosBensPatrimoniais != null)
                      bem.dadosBensPatrimoniais.dominioStatus =
                          novoItemSelecionado;
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
