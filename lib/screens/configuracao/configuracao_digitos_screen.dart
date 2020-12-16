import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/components/stores/index_store.dart';

class ConfiguracaoDigitosScreen extends StatefulWidget {
  @override
  _ConfiguracaoDigitosScreenState createState() =>
      _ConfiguracaoDigitosScreenState();
}

class _ConfiguracaoDigitosScreenState extends State<ConfiguracaoDigitosScreen> {
  final _form = GlobalKey<FormState>();
  // String _valorInicial;
  String _valorFinal;
  ConfiguracaoStore _configuracaoStore;
  RegExp _numeric = RegExp(r'^-?[0-9]+$');

  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

  void _adicionarDigitos() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();

    if (_configuracaoStore.mascara != null) {
      _configuracaoStore.salvarMascara(
        mascara: _valorFinal == null
            ? _configuracaoStore.mascara.mascara
            : _valorFinal,
        existente: false,
        id: _configuracaoStore.mascara.id,
      );
    } else {
      _configuracaoStore.salvarMascara(
        mascara: _valorFinal,
        existente: true,
      );
    }

    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    _configuracaoStore = Provider.of<ConfiguracaoStore>(context);

    _configuracaoStore.buscarMascara();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      // ignore: missing_return
      builder: (context) {
        switch (_configuracaoStore.mascaraState) {
          case MascaraState.inicial:
          case MascaraState.carregando:
            return Center(
              child: CircularProgressIndicator(),
            );
          case MascaraState.carregado:
            return SingleChildScrollView(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Form(
                        key: _form,
                        child: TextFormField(
                          key: Key('digitosForm'),
                          initialValue: _configuracaoStore.mascara != null
                              ? _configuracaoStore.mascara.mascara
                              : null,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText:
                                'Quantidade de digitos considerados na leitura',
                            helperText:
                                'Informe os digitos(min 6, max 15) Ex.: 999999',
                          ),
                          onChanged: (value) {
                            _valorFinal = value;
                          },
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (!isNumeric(value)) {
                              return 'Permitido somente números.';
                            } else if (value != null &&
                                value != "" &&
                                (value.length < 6 || value.length > 16))
                              return 'Valor inserido não está entre 6 e 15.';
                            return null;
                          },
                        ),
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.save),
                        onPressed: _adicionarDigitos,
                        key: ValueKey('digitosButton'),
                        label: const Text('Salvar Digitos'),
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).textTheme.button.color,
                      )
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
