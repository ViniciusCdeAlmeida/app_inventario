import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ConfiguracaoNumeroTela extends StatefulWidget {
  @override
  _ConfiguracaoNumeroTelaState createState() => _ConfiguracaoNumeroTelaState();
}

class _ConfiguracaoNumeroTelaState extends State<ConfiguracaoNumeroTela> {
  final _form = GlobalKey<FormState>();
  String _valorInicial;
  String _valorFinal;

  void _adicionarLetra() {
    _form.currentState.save();

    if (_valorFinal == null) {
      Provider.of<EstruturaLevantamento>(context)
          .setDigitoVerificador(_valorInicial);
    } else {
      Provider.of<EstruturaLevantamento>(context)
          .setDigitoVerificador(_valorFinal);
    }

    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    _valorInicial =
        Provider.of<EstruturaLevantamento>(context).getDigitoVerificador;
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
                  initialValue: _valorInicial,
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
