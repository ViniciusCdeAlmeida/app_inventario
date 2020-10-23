import 'package:app_inventario/stores/bensPatrimoniais_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/estruturaInventario.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/telaArgumentos.dart';

import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/inicializacao.dart';
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
  String _digitos;
  int _idUlAtual;
  BemPatrimonial _item;
  List<Dominio> _dominiosInicial = [];
  Future<BemPatrimonial> bemPatrimonial;
  TelaArgumentos unidadeArgs;

  var _expanded = false;
  var _isLoading = false;

  var _edicaoBemInvent = InventarioBemPatrimonial(
    tipoMobile: 'levantamentoFisico',
    bemNaoEncontrado: false,
    bemNaoInventariado: false,
  );

  @override
  void didChangeDependencies() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    bemPatrimonial = Provider.of<EstruturaLevantamento>(context, listen: false)
        .buscaBensPorId(unidadeArgs.arg1);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Inicializacao>(context, listen: false).getDominiosDB();
    });
    super.initState();
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
    String _digitoVerificador =
        Provider.of<EstruturaLevantamento>(context, listen: false)
            .getDigitoVerificador;
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

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

      await Provider.of<BensPatrimoniaisStore>(
        context,
        listen: false,
      ).atualizaItem(_item.id);
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
    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  void _atribuiValores() {
    unidadeArgs = ModalRoute.of(context).settings.arguments;
    final usuarioColetante =
        Provider.of<Autenticacao>(context, listen: false).usuarioLogado;

    final idUnidade =
        Provider.of<Autenticacao>(context, listen: false).idUnidade;
    if (_item.dadosBensPatrimoniais != null &&
        _item.dadosBensPatrimoniais.inventarioBemPatrimonial != null) {
      _item.dadosBensPatrimoniais.inventariado = true;
    }

    _edicaoBemInvent.dominioSituacaoFisica = _item.dominioSituacaoFisica;
    _edicaoBemInvent.dominioStatus = _item.dominioStatus;
    _edicaoBemInvent.dominioStatusInventarioBem =
        _item.dadosBensPatrimoniais != null
            ? _item.dadosBensPatrimoniais.dominioStatusInventarioBem
            : null;
    _edicaoBemInvent.idDadosBemPatrimonialMobile = _item.id;
    _edicaoBemInvent.idInventarioEstruturaOrganizacionalMobile = unidadeArgs.id;
    _edicaoBemInvent.material = _item.material;
    _edicaoBemInvent.caracteristicas = _item.caracteristicas;
    _edicaoBemInvent.nomeUsuarioColeta = usuarioColetante;
    _edicaoBemInvent.numeroPatrimonial = _item.numeroPatrimonial;
    _edicaoBemInvent.numeroPatrimonialAntigo = _item.numeroPatrimonial;
    _edicaoBemInvent.idUnidadeOrganizacional = idUnidade;
    _edicaoBemInvent.idDominioSituacaoFisica = _item.dominioSituacaoFisica.id;
    _edicaoBemInvent.idDominioStatus = _item.dominioStatus.id;
    _edicaoBemInvent.idEstruturaOrganizacionalAtual =
        _item.estruturaOrganizacionalAtual.id;
    _edicaoBemInvent.idMaterial = _item.material.id;

    _edicaoBemInvent.enviado = false;
  }

  @override
  Widget build(BuildContext context) {
    String _digitoVerificador =
        Provider.of<EstruturaLevantamento>(context, listen: false)
            .getDigitoVerificador;
    _digitos = Provider.of<EstruturaLevantamento>(context, listen: false)
        .getDigitosLeitura;
    _idUlAtual =
        Provider.of<EstruturaLevantamento>(context, listen: false).getUlAtual;

    return FutureBuilder(
      future: bemPatrimonial,
      builder: (context, snapshot) {
        _item = snapshot.data;
        if (_item != null) _atribuiValores();
        return snapshot.data == null
            ? Scaffold(
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
                drawer: AppDrawer(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Item: ${snapshot.data.numeroPatrimonial}',
                    style: TextStyle(fontSize: 15),
                  ),
                  actions: [
                    if (snapshot.data.dadosBensPatrimoniais != null
                        ? !snapshot.data.dadosBensPatrimoniais.inventariado
                        : !snapshot.data.inventariado)
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
                              snapshot.data.material.codigoEDescricao),
                        ),
                        if (_idUlAtual !=
                            snapshot.data.estruturaOrganizacionalAtual.id)
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Bem pertence a U.L.: ' +
                                  snapshot
                                      .data.estruturaOrganizacionalAtual.nome,
                              style: TextStyle(color: Colors.red[800]),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            key: Key('numeroPatrimonialText'),
                            enabled: false,
                            initialValue: snapshot.data.numeroPatrimonial,
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
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      width: 1, color: Colors.grey[500]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: SearchableDropdown.single(
                                  label: Text('Situação fisica'),
                                  isExpanded: true,
                                  dialogBox: true,
                                  displayClearIcon: false,
                                  readOnly:
                                      snapshot.data.dadosBensPatrimoniais !=
                                              null
                                          ? snapshot.data.dadosBensPatrimoniais
                                              .inventariado
                                          : snapshot.data.inventariado,
                                  iconDisabledColor: Colors.black,
                                  value: Provider.of<Inicializacao>(context)
                                      .getDominiosBens(snapshot.data
                                                      .dadosBensPatrimoniais !=
                                                  null &&
                                              snapshot
                                                      .data
                                                      .dadosBensPatrimoniais
                                                      .dominioSituacaoFisica !=
                                                  null
                                          ? snapshot.data.dadosBensPatrimoniais
                                              .dominioSituacaoFisica.chave
                                          : snapshot
                                              .data.dominioSituacaoFisica.chave)
                                      .firstWhere(
                                        (element) =>
                                            element
                                                .id ==
                                            (snapshot.data.dadosBensPatrimoniais !=
                                                        null &&
                                                    snapshot
                                                            .data
                                                            .dadosBensPatrimoniais
                                                            .dominioSituacaoFisica !=
                                                        null
                                                ? snapshot
                                                    .data
                                                    .dadosBensPatrimoniais
                                                    .dominioSituacaoFisica
                                                    .id
                                                : snapshot.data
                                                    .dominioSituacaoFisica.id),
                                      ),
                                  items: Provider.of<Inicializacao>(context)
                                      .getDominiosDropdownBens(snapshot
                                          .data.dominioSituacaoFisica.chave),
                                  onChanged: (novoItemSelecionado) {
                                    setState(
                                      () {
                                        _edicaoBemInvent.dominioSituacaoFisica =
                                            novoItemSelecionado;
                                        _edicaoBemInvent
                                                .idDominioSituacaoFisica =
                                            novoItemSelecionado.id;
                                        snapshot.data.dominioSituacaoFisica =
                                            novoItemSelecionado;
                                        if (snapshot
                                                .data.dadosBensPatrimoniais !=
                                            null)
                                          snapshot.data.dadosBensPatrimoniais
                                                  .dominioSituacaoFisica =
                                              novoItemSelecionado;
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
                                  border: Border.all(
                                      width: 1, color: Colors.grey[500]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: SearchableDropdown.single(
                                  label: Text('Status'),
                                  isExpanded: true,
                                  dialogBox: true,
                                  displayClearIcon: false,
                                  readOnly:
                                      snapshot.data.dadosBensPatrimoniais !=
                                              null
                                          ? snapshot.data.dadosBensPatrimoniais
                                              .inventariado
                                          : snapshot.data.inventariado,
                                  iconDisabledColor: Colors.black,
                                  value: Provider.of<Inicializacao>(context)
                                      .getDominiosBens(snapshot.data
                                                      .dadosBensPatrimoniais !=
                                                  null &&
                                              snapshot
                                                      .data
                                                      .dadosBensPatrimoniais
                                                      .dominioStatus !=
                                                  null
                                          ? snapshot.data.dadosBensPatrimoniais
                                              .dominioStatus.chave
                                          : snapshot.data.dominioStatus.chave)
                                      .firstWhere(
                                        (element) =>
                                            element.id ==
                                            (snapshot.data
                                                            .dadosBensPatrimoniais !=
                                                        null &&
                                                    snapshot
                                                            .data
                                                            .dadosBensPatrimoniais
                                                            .dominioStatus !=
                                                        null
                                                ? snapshot
                                                    .data
                                                    .dadosBensPatrimoniais
                                                    .dominioStatus
                                                    .id
                                                : snapshot
                                                    .data.dominioStatus.id),
                                      ),
                                  items: Provider.of<Inicializacao>(context)
                                      .getDominiosDropdownBens(
                                          snapshot.data.dominioStatus.chave),
                                  onChanged: (novoItemSelecionado) {
                                    setState(
                                      () {
                                        _edicaoBemInvent.dominioStatus =
                                            novoItemSelecionado;
                                        _edicaoBemInvent.idDominioStatus =
                                            novoItemSelecionado.id;
                                        snapshot.data.dominioStatus =
                                            novoItemSelecionado;
                                        if (snapshot
                                                .data.dadosBensPatrimoniais !=
                                            null)
                                          snapshot.data.dadosBensPatrimoniais
                                                  .dominioStatus =
                                              novoItemSelecionado;
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
                                  maxLength:
                                      _digitos == null ? null : _digitos.length,
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
                                      itemCount:
                                          snapshot.data.caracteristicas.length,
                                      itemBuilder: (_, idx) {
                                        List<DropdownMenuItem<Dominio>>
                                            _dominiosDropdownAtual =
                                            Provider.of<Inicializacao>(context)
                                                .getDominiosDropdownBens(
                                                    snapshot
                                                        .data
                                                        .caracteristicas[idx]
                                                        .materialCaracteristica
                                                        .caracteristica
                                                        .chaveDominio);
                                        Dominio itemAtual = Provider.of<
                                                Inicializacao>(context)
                                            .getDominiosBens(snapshot
                                                .data
                                                .caracteristicas[idx]
                                                .materialCaracteristica
                                                .caracteristica
                                                .chaveDominio)
                                            .firstWhere(
                                                (element) =>
                                                    element.id.toString() ==
                                                    snapshot
                                                        .data
                                                        .caracteristicas[idx]
                                                        .valorMaterialCaracteristica,
                                                orElse: () => null);
                                        return snapshot
                                                    .data
                                                    .caracteristicas[idx]
                                                    .materialCaracteristica
                                                    .caracteristica
                                                    .dominioTipoDado
                                                    .nome ==
                                                'TIPO_DOMINIO'
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child:
                                                    SearchableDropdown.single(
                                                  readOnly:
                                                      snapshot.data
                                                                  .dadosBensPatrimoniais !=
                                                              null
                                                          ? snapshot
                                                              .data
                                                              .dadosBensPatrimoniais
                                                              .inventariado
                                                          : snapshot.data
                                                              .inventariado,
                                                  iconDisabledColor:
                                                      Colors.black,
                                                  label: snapshot
                                                      .data
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
                                                      keyword
                                                          .split(" ")
                                                          .forEach(
                                                        (k) {
                                                          int i = 0;
                                                          _dominiosInicial
                                                              .forEach(
                                                            (item) {
                                                              if (k.isNotEmpty &&
                                                                  (item
                                                                      .descricao
                                                                      .toString()
                                                                      .toLowerCase()
                                                                      .contains(
                                                                          k.toLowerCase()))) {
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
                                                  hint: snapshot
                                                      .data
                                                      .caracteristicas[idx]
                                                      .materialCaracteristica
                                                      .caracteristica
                                                      .descricao,
                                                  isExpanded: true,
                                                  onChanged: (itemSelecionado) {
                                                    setState(
                                                      () {
                                                        _edicaoBemInvent
                                                                .caracteristicas[
                                                                    idx]
                                                                .valorMaterialCaracteristica =
                                                            itemSelecionado ==
                                                                    null
                                                                ? null
                                                                : itemSelecionado
                                                                    .id
                                                                    .toString();
                                                      },
                                                    );
                                                  },
                                                ),
                                              )
                                            : snapshot
                                                        .data
                                                        .caracteristicas[idx]
                                                        .materialCaracteristica
                                                        .caracteristica
                                                        .dominioTipoDado
                                                        .nome ==
                                                    'TEXT_FIELD'
                                                ? Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: TextFormField(
                                                      key: Key(
                                                          'numeroPatrimonialText'),
                                                      enabled: snapshot.data
                                                                  .inventariado ==
                                                              true
                                                          ? false
                                                          : true,
                                                      initialValue: snapshot
                                                          .data
                                                          .caracteristicas[idx]
                                                          .valorMaterialCaracteristica,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .bottom,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: snapshot
                                                            .data
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
                                                                .caracteristicas[
                                                                    idx]
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
      },
    );
  }
}
