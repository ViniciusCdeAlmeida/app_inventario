import '../../widgets/login/login_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../widgets/cabecalho/menu_cabecalho.dart';

class LoginTela extends StatelessWidget {
  AppBar appbar;

  LoginTela({this.appbar});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('CITSmart - Inventário'),
      // ),
      appBar: appbar,
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
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                      transform: Matrix4.rotationZ(-8 * pi / 180)
                        ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange.shade900,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'App Inventario',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1, child: LoginCard(),
                    // AuthCard(),
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

// import '../../widgets/login/login_card.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import '../../widgets/cabecalho/menu_cabecalho.dart';

// class LoginTela extends StatelessWidget {
//   static const routeName = '/home';
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CITSmart - Inventário'),
//       ),
//       drawer: MenuDrawer(),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(199, 177, 14, 78).withOpacity(0.5),
//                   Color.fromRGBO(34, 180, 199, 78).withOpacity(0.9),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 stops: [0, 1],
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               height: deviceSize.height,
//               width: deviceSize.width,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Flexible(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 20.0),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
//                       transform: Matrix4.rotationZ(-8 * pi / 180)
//                         ..translate(-10.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.deepOrange.shade900,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 8,
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         'App Inventario',
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: deviceSize.width > 600 ? 2 : 1, child: LoginCard(),
//                     // AuthCard(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
