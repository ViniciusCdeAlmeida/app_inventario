import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/components/stores/index_store.dart';

class ConfiguracaoPrefixoScreen extends StatefulWidget {
  @override
  _ConfiguracaoPrefixoScreenState createState() =>
      _ConfiguracaoPrefixoScreenState();
}

class _ConfiguracaoPrefixoScreenState extends State<ConfiguracaoPrefixoScreen> {
  final _form = GlobalKey<FormState>();
  // String _valorInicial;
  String _valorFinal;
  ConfiguracaoStore _configuracaoStore;

  void _adicionarLetra() {
    _form.currentState.save();

    if (_configuracaoStore.prefixo != null) {
      _configuracaoStore.salvarPrefixo(
        prefixo: _valorFinal,
        existente: false,
        id: _configuracaoStore.prefixo.id,
      );
    } else {
      _configuracaoStore.salvarPrefixo(
        prefixo: _valorFinal,
        existente: true,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    _configuracaoStore = Provider.of<ConfiguracaoStore>(context);
    _configuracaoStore.buscarPrefixo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Form(
                key: _form,
                child: TextFormField(
                  key: ValueKey('novaLetraForm'),
                  initialValue: _configuracaoStore.prefixo != null
                      ? _configuracaoStore.prefixo.prefixo
                      : null,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Letra do novo número patrimonial',
                    helperText: 'Informe a letra',
                  ),
                  onChanged: (value) {
                    _valorFinal = value;
                  },
                ),
              ),
              FlatButton.icon(
                icon: Icon(Icons.save),
                key: ValueKey('novaLetraButton'),
                onPressed: _adicionarLetra,
                label: const Text('Salvar'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
