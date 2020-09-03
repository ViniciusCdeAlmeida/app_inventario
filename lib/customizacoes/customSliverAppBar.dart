import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatefulWidget {
  final String titulo;

  MySliverAppBar({this.titulo});

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool _search = false;

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
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
      title: Text(_search ? '' : widget.titulo),
      actions: [
        !_search == false
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Provider.of<EstruturaLevantamento>(context, listen: false)
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
        title: _search
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 5),
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
                      icon: Icon(Icons.search),
                      contentPadding: const EdgeInsets.only(left: 5, bottom: 8),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    controller: _controller,
                    // onEditingComplete: () {
                    // Provider.of<EstruturaLevantamento>(context, listen: false)
                    //     .filtraBens(_controller.text);
                    // },
                    onChanged: (value) => Provider.of<EstruturaLevantamento>(
                            context,
                            listen: false)
                        .filtraBens(_controller.text),
                  ),
                ),
              )
            : null,
        titlePadding: EdgeInsetsDirectional.only(
          bottom: 3.3,
          start: 50,
          end: 50,
        ),
      ),
    );
  }
}
