import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:GRPInventario/custom/index.dart';
import 'package:GRPInventario/screens/index.dart';
import 'package:GRPInventario/stores/index.dart';

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

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      if (!_loginStore.usuarioOffline) {
        _loginStore
            .login(
              _loginData['userName'],
              _loginData['password'],
            )
            .then(
              (_) => Navigator.of(context).pushNamed(
                OrganizacaoTela.routeName,
              ),
            )
            .catchError(
              (error) => erroDialog(context, error.toString()),
            );
      } else {
        _loginStore.logarOffline().then(
              (_) => Navigator.of(context).pushNamed(
                OrganizacaoTela.routeName,
              ),
            );
      }
    } catch (error) {
      erroDialog(context, error.toString());
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Iniciar Offline?'),
                        IconButton(
                            icon: Icon(Icons.check_box,
                                color: _loginStore.usuarioOffline
                                    ? Theme.of(context).toggleableActiveColor
                                    : null),
                            onPressed: () {
                              _loginStore.usuarioOffline
                                  ? _loginStore.loginOffline(false)
                                  : _loginStore.loginOffline(true);
                            })
                      ],
                    ),
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
