import 'package:app_inventario/stores/configuracao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ConfiguracaoNumeroTela extends StatefulWidget {
  @override
  _ConfiguracaoNumeroTelaState createState() => _ConfiguracaoNumeroTelaState();
}

class _ConfiguracaoNumeroTelaState extends State<ConfiguracaoNumeroTela> {
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
                  key: Key('digitoText'),
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
                onPressed: _adicionarLetra,
                label: Text('Salvar'),
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
