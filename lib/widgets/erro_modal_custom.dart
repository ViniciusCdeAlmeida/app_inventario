import 'package:flutter/material.dart';

Future erroDialog(BuildContext context, String erro) => showDialog<Null>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Não foi possivel realizar o login.'),
        content: const Text(
            'A conexão é invalida ou o servidor está fora de alcance.'),
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
