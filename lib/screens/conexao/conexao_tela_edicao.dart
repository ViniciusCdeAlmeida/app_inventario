import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/models/serialized/index.dart';
import 'package:GRPInventario/stores/index.dart';

class ConexaoEdicaoTela extends StatefulWidget {
  static const routeName = '/ConexaoEdicaoTela';

  @override
  _ConexaoEdicaoTelaState createState() => _ConexaoEdicaoTelaState();
}

class _ConexaoEdicaoTelaState extends State<ConexaoEdicaoTela> {
  final _nomeFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();
  final _ativaFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  ConexaoStore _conexaoStore;

  var _edicaoConexao = Conexao(
    id: null,
    url: '',
    nome: '',
    ativo: false,
  );

  var _valoresIniciais = Conexao(
    url: null,
    nome: null,
    ativo: false,
  );

  @override
  void didChangeDependencies() {
    final idConexao = ModalRoute.of(context).settings.arguments;
    _conexaoStore = Provider.of<ConexaoStore>(context, listen: false);

    if (idConexao != null) {
      _conexaoStore.buscarConexao(idConexao);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nomeFocusNode.dispose();
    _urlFocusNode.dispose();
    _ativaFocusNode.dispose();
    if (_conexaoStore.conexao != null) {
      _conexaoStore.limpaDados();
    }
    super.dispose();
  }

  void _salvarForm() {
    final valido = _form.currentState.validate();

    if (!valido) {
      return;
    }
    _form.currentState.save();
    if (_conexaoStore.conexao != null && _conexaoStore.conexao.id != null) {
      _edicaoConexao.id = _conexaoStore.conexao.id;
      _conexaoStore.salvarConexao(conexao: _edicaoConexao, existente: true);
    } else {
      _conexaoStore.salvarConexao(conexao: _edicaoConexao, existente: false);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conexão'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _salvarForm,
          ),
        ],
      ),
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_conexaoStore.conexaoState) {
            case ConexaoState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConexaoState.inicial:
            case ConexaoState.carregado:
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        key: Key('urlText'),
                        initialValue: _conexaoStore.conexao == null
                            ? null
                            : _conexaoStore.conexao.url,
                        decoration: InputDecoration(
                          labelText: 'Url',
                          helperText: 'Informe a Url',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_urlFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe a URL.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _edicaoConexao = Conexao(
                            url: value,
                            nome: _edicaoConexao.nome,
                            ativo: _edicaoConexao.ativo,
                            id: _edicaoConexao.id,
                          );
                        },
                      ),
                      TextFormField(
                        key: Key('nomeText'),
                        initialValue: _conexaoStore.conexao == null
                            ? null
                            : _conexaoStore.conexao.nome,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          helperText: 'Informe o nome',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nomeFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o Nome.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _edicaoConexao = Conexao(
                            nome: value,
                            url: _edicaoConexao.url,
                            ativo: _edicaoConexao.ativo,
                            id: _edicaoConexao.id,
                          );
                        },
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Ativa"),
                            Switch(
                              key: Key('switchText'),
                              value: _conexaoStore.conexao == null
                                  ? _valoresIniciais.ativo
                                  : _conexaoStore.conexao.ativo,
                              onChanged: (value) {
                                setState(() {
                                  if (_conexaoStore.conexao != null)
                                    _conexaoStore.conexao.ativo = value;
                                  _valoresIniciais.ativo = value;
                                  _edicaoConexao = Conexao(
                                    ativo: value,
                                    url: _edicaoConexao.url,
                                    nome: _edicaoConexao.nome,
                                    id: _edicaoConexao.id,
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  key: _form,
                ),
              );
          }
        },
      ),
    );
  }
}
