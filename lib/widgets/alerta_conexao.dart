import 'package:flutter/material.dart';

class AlertaConexao extends StatefulWidget {
  @override
  _AlertaConexaoState createState() => _AlertaConexaoState();
}

class _AlertaConexaoState extends State<AlertaConexao> {
  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    return alert;
  }
}
