import 'package:flutter/material.dart';

class ConfiguracaoBensTela extends StatefulWidget {
  @override
  _ConfiguracaoBensTelaState createState() => _ConfiguracaoBensTelaState();
}

class _ConfiguracaoBensTelaState extends State<ConfiguracaoBensTela> {
  final _bensControler = TextEditingController();

  void _adicionarDigitosBens() {
    final entradaQtde = _bensControler.text;

    if (entradaQtde.length > 15 || entradaQtde.length < 6) return;

    // Configaracao()
    Navigator.of(context).pop();
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
              TextField(
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Quantidade de digitos considerados na leitura',
                  helperText: 'Informe os digitos(min 6, max 15) Ex.: 999999',
                ),
                controller: _bensControler,
                onSubmitted: null,
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
