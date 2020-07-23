import 'package:app_inventario/providers/unidade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoadingInfo extends StatefulWidget {
  createState() => LoadingInfoState();
}

class LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Unidades>(
      builder: (context, bloc, child) {
        bloc.getUnidades.forEach((element) {
          print(element.codigo);
        });
        // _controller.forward().then((_) {
        //   _controller.reverse();
        // });
        return Container();
        // FadeTransition(
        //   child: Icon(Icons.loop),
        //   opacity: Tween(begin: .5, end: 1.0).animate(
        //       CurvedAnimation(curve: Curves.easeIn, parent: _controller)),
        // );
      },
    );
  }
}
