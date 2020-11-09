import 'dart:ui';

import 'package:app_inventario/stores/bensPrevistos_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatefulWidget {
  final String titulo;

  MySliverAppBar({this.titulo});

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar>
    with SingleTickerProviderStateMixin {
  bool _search = false;

  TextEditingController _controller;
  AnimationController _controllerAnimation;
  Animation<Offset> _slideAnimation;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerAnimation = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1.5, 1.5),
    ).animate(
      CurvedAnimation(
        parent: _controllerAnimation,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      backgroundColor: Colors.yellow[800],
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30.0),
          bottomRight: const Radius.circular(30.0),
        ),
      ),
      title: Text(
        _search ? '' : widget.titulo,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(fontSize: 14.0),
        maxLines: 3,
      ),
      actions: [
        !_search == false
            ? IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Provider.of<BensPrevistosStore>(context, listen: false)
                      .limpaFiltrados();
                  _controller.text = '';
                  setState(() {
                    _search = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _search = true;
                  });
                },
              ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final inAnimation =
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);
            final outAnimation =
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);

            if (_search) {
              return ClipRect(
                child: SlideTransition(
                  position: inAnimation,
                  child: child,
                ),
              );
            } else {
              return ClipRect(
                child: SlideTransition(
                  position: outAnimation,
                  child: child,
                ),
              );
            }
          },
          child: _search
              ? SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[500],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<BensPrevistosStore>(context,
                                      listen: false)
                                  .limpaFiltrados();
                              _controller.text = '';
                            },
                          ),
                          icon: Icon(Icons.search),
                          contentPadding: const EdgeInsets.only(top: 5),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        controller: _controller,
                        onEditingComplete: () {
                          Provider.of<BensPrevistosStore>(context,
                                  listen: false)
                              .filtraBens(_controller.text);
                        },
                        onChanged: (value) => Provider.of<BensPrevistosStore>(
                                context,
                                listen: false)
                            .filtraBens(_controller.text),
                      ),
                    ),
                  ),
                )
              : null,
        ),
        // : null,
        titlePadding: const EdgeInsetsDirectional.only(
          bottom: 3.3,
          start: 50,
          end: 50,
        ),
      ),
    );
  }
}
