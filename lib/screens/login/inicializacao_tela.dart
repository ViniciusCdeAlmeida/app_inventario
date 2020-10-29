import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InicializacaoTela extends StatefulWidget {
  static const routeName = '/inicializacaoTela';

  @override
  _InicializacaoTelaState createState() => _InicializacaoTelaState();
}

class _InicializacaoTelaState extends State<InicializacaoTela> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacementNamed('/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Container(
          child: Center(
            child: Text('TELA INICIAL'),
          ),
        ),
      ),
    );
  }
}
