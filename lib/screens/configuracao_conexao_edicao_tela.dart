import 'package:app_inventario/models/conexao.dart';
import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfiguracaoConexaoEdicaoTela extends StatefulWidget {
  static const routeName = '/configuracaoEdicaoTela';

  @override
  _ConfiguracaoConexaoEdicaoTelaState createState() =>
      _ConfiguracaoConexaoEdicaoTelaState();
}

class _ConfiguracaoConexaoEdicaoTelaState
    extends State<ConfiguracaoConexaoEdicaoTela> {
  final _nomeFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();
  final _ativaFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _edicaoConexao = Conexao(
    id: null,
    url: '',
    nome: '',
    ativo: false,
  );

  var _valoresIniciais = {
    'url': '',
    'nome': '',
    'ativo': false,
  };

  var _inicial = true;

  @override
  void didChangeDependencies() {
    // if (_inicial) {
    //   final conexaoId = ModalRoute.of(context).settings.arguments as String;
    //   if (conexaoId != null) {
    //     _edicaoConexao =
    //         Provider.of<ConfiguracaoConexao>(context, listen: false)
    //             .findById(conexaoId);
    //     _valoresIniciais = {
    //       'url': _edicaoConexao.url,
    //       'nome': _edicaoConexao.nome,
    //       'ativo': _edicaoConexao.ativo,
    //     };
    //   }
    // }
    // _inicial = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nomeFocusNode.dispose();
    _urlFocusNode.dispose();
    _ativaFocusNode.dispose();
    super.dispose();
  }

  void _salvarForm() {
    final ehValido = _form.currentState.validate();

    if (!ehValido) {
      return;
    }
    _form.currentState.save();
    if (_edicaoConexao.id != null) {
      Provider.of<ConfiguracaoConexao>(context, listen: false)
          .atualizarConexao(_edicaoConexao.id, _edicaoConexao);
    } else {
      Provider.of<ConfiguracaoConexao>(context, listen: false)
          .adicionarConexao(_edicaoConexao);
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
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                key: Key('urlText'),
                initialValue: _valoresIniciais['url'],
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
                initialValue: _valoresIniciais['nome'],
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
                      value: _valoresIniciais['ativo'],
                      onChanged: (value) {
                        setState(
                          () {
                            _valoresIniciais['ativo'] = value;
                            _edicaoConexao = Conexao(
                              ativo: value,
                              url: _edicaoConexao.url,
                              nome: _edicaoConexao.nome,
                              id: _edicaoConexao.id,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          key: _form,
        ),
      ),
    );
  }
}
