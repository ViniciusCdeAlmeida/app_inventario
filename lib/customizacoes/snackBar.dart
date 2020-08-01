import 'package:flutter/material.dart';

class SnackBarPage extends SnackBar {
  final int tempo;
  final String texto;

  SnackBarPage({this.tempo, this.texto});

  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(texto),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: tempo),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
      // );

      // Find the Scaffold in the widget tree and use
      // it to show a SnackBar.
      // Scaffold.of(context).showSnackBar(snackBar);
      // },
      // child: Text('Show SnackBar'),
      // ),
    );
  }
}
