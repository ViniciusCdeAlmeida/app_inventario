import 'package:flutter/material.dart';

class ConfiguracaoNumeroTela extends StatefulWidget {
  @override
  _ConfiguracaoNumeroTelaState createState() => _ConfiguracaoNumeroTelaState();
}

class _ConfiguracaoNumeroTelaState extends State<ConfiguracaoNumeroTela> {
  final _letraControler = TextEditingController();

  void _adicionarLetra() {
    final entradaLetra = _letraControler.text;

    // Configaracao()
    Navigator.of(context).pop();
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
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Letra do novo número patrimonial',
                  helperText: 'Informe a letra',
                ),
                controller: _letraControler,
                onSubmitted: null,
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
