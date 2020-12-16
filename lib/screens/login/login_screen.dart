import 'package:GRPInventario/screens/login/widgets/login/login_card.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:flutter/material.dart';
// import 'dart:math';

class LoginScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Inventário - GRP'),
        leading: IconButton(
            icon: Icon(
              Icons.view_headline,
              key: ValueKey('menuDrawer'),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(199, 177, 14, 78).withOpacity(0.5),
                  Color.fromRGBO(34, 180, 199, 78).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 94.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.deepOrange.shade900,
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 8,
                        //     color: Colors.black26,
                        //     offset: Offset(0, 2),
                        //   ),
                        // ],
                      ),
                      child: const Text(
                        'App Inventario',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: LoginCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
