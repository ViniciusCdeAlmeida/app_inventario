import 'package:app_inventario/providers/configuracao_conexao.dart';

import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/screens/organizacao/organizacao_tela.dart';
import 'package:app_inventario/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  LoginStore _loginStore;
  Map<String, String> _loginData = {
    'user': '',
    'password': '',
  };

  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text('Error'),
  //       content: Text(message),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future<void> _submit() async {
    var _conexoes = Provider.of<ConfiguracaoConexao>(context, listen: false);
    var _autenticacao = Provider.of<Autenticacao>(context, listen: false);
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      _autenticacao.conexaoAtual(_conexoes.conexoes);
      // await Provider.of<Autenticacao>(context, listen: false).login(
      //   _loginData['userName'],
      //   _loginData['password'],
      // );
      _loginStore
          .login(
            _loginData['userName'],
            _loginData['password'],
          )
          .then(
            (_) => Navigator.of(context).pushNamed(
              OrganizacaoTela.routeName,
            ),
          );
    } catch (error) {
      await showDialog<Null>(
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
    }
  }

  @override
  Widget build(BuildContext context) {
    _loginStore = Provider.of<LoginStore>(context);
    final deviceSize = MediaQuery.of(context).size;
    return Observer(
      builder: (_) => Card(
        key: _scaffoldKey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Usuario'),
                    onSaved: (user) {
                      _loginData['userName'] = user;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    controller: _passwordController,
                    onSaved: (pass) {
                      _loginData['password'] = pass;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (_loginStore.logando) loading() else showButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loading() {
    return CircularProgressIndicator();
  }

  Widget showButton() {
    return RaisedButton(
      onPressed: _submit,
      child: Text('Logar'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 8.0,
      ),
    );
  }
}
