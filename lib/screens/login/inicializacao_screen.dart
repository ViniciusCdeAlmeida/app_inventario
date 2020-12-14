import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InicializacaoScreen extends StatefulWidget {
  static const routeName = '/inicializacaoScreen';

  @override
  _InicializacaoScreenState createState() => _InicializacaoScreenState();
}

class _InicializacaoScreenState extends State<InicializacaoScreen> {
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
