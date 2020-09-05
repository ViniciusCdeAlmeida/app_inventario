import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfiguracaoBensTela extends StatefulWidget {
  @override
  _ConfiguracaoBensTelaState createState() => _ConfiguracaoBensTelaState();
}

class _ConfiguracaoBensTelaState extends State<ConfiguracaoBensTela> {
  final _form = GlobalKey<FormState>();
  String _valorInicial;
  String _valorFinal;

  void _adicionarDigitosBens() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();

    if (_valorFinal == null) {
      Provider.of<EstruturaLevantamento>(context)
          .setDigitosLeitura(_valorInicial);
    } else {
      Provider.of<EstruturaLevantamento>(context)
          .setDigitosLeitura(_valorFinal);
    }

    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    _valorInicial =
        Provider.of<EstruturaLevantamento>(context).getDigitosLeitura;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Form(
                key: _form,
                child: TextFormField(
                  key: Key('digitosText'),
                  initialValue: _valorInicial,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Quantidade de digitos considerados na leitura',
                    helperText: 'Informe os digitos(min 6, max 15) Ex.: 999999',
                  ),
                  onChanged: (value) {
                    _valorFinal = value;
                  },
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira um valor.';
                    }
                    if (value.length < 5 || value.length > 16) {
                      return 'Valor inserido não está entre 6 e 15.';
                    }
                    return null;
                  },
                ),
              ),
              FlatButton.icon(
                icon: Icon(Icons.save),
                onPressed: _adicionarDigitosBens,
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
