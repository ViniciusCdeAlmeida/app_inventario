import 'package:flutter/material.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/screens/index_screens.dart';
import 'package:GRPInventario/screens/bens/widgets/bens/ler_bens_item.dart';
import 'package:GRPInventario/utils/index_utils.dart';
import 'package:GRPInventario/widgets/index_widget.dart';

class UnidadeItem extends StatefulWidget {
  final EstruturaInventario unidade;

  UnidadeItem(this.unidade);

  @override
  _UnidadeItemState createState() => _UnidadeItemState();
}

class _UnidadeItemState extends State<UnidadeItem>
    with TickerProviderStateMixin {
  // Animation<Offset> _slideAnimation;
  Animation<double> _fadeAnimation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    // _slideAnimation = Tween<Offset>(
    //   begin: Offset(1.0, 0.0),
    //   end: Offset(0, 0),
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.ease,
    //   ),
    // );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Future.delayed(const Duration(seconds: 2), () =>
      _controller.forward();
      // );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _redirecionamento(AcoesUnidade acoes, int idEstrutura) {
    switch (acoes) {
      case AcoesUnidade.lerBens:
        Navigator.of(context).pushNamed(
          LerBensItens.routeName,
          arguments: ScreenArgumentos(
            id: widget.unidade.id,
            arg1: widget.unidade.idInventario.toString(),
            arg2: widget.unidade.estruturaOrganizacional.codigoENome,
          ),
        );
        break;
      case AcoesUnidade.bensPrevistos:
        Navigator.of(context).pushNamed(
          PrevistosBensScreen.routeName,
          arguments: ScreenArgumentos(
            id: idEstrutura,
            arg1: widget.unidade.id.toString(),
            arg2: widget.unidade.estruturaOrganizacional.codigoENome,
          ),
        );
        break;
      case AcoesUnidade.estatisticas:
        print(idEstrutura);
        print('3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => FadeTransition(
        opacity: _fadeAnimation,
        child: child,
      ),
      child: Column(
        children: [
          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: widget.unidade.dominioStatusInventarioEstrutura != null &&
                    widget.unidade.dominioStatusInventarioEstrutura.descricao ==
                        "Tratada"
                ? Colors.brown[200]
                : Colors.white,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                FittedBox(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ListTile(
                                trailing: PopupMenuButton<AcoesUnidade>(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                  onSelected: (value) {
                                    _redirecionamento(
                                        value,
                                        widget.unidade.estruturaOrganizacional
                                            .id);
                                  },
                                  offset: Offset(0, 100),
                                  itemBuilder: (context) =>
                                      <PopupMenuEntry<AcoesUnidade>>[
                                    PopupMenuItem<AcoesUnidade>(
                                      child: PopupMenuCustom(
                                          'Ler Bens', Icons.visibility),
                                      value: AcoesUnidade.lerBens,
                                    ),
                                    const PopupMenuDivider(),
                                    PopupMenuItem<AcoesUnidade>(
                                      child: PopupMenuCustom(
                                          'Bens', Icons.content_paste),
                                      value: AcoesUnidade.bensPrevistos,
                                    ),
                                    const PopupMenuDivider(),
                                    PopupMenuItem<AcoesUnidade>(
                                      child: PopupMenuCustom(
                                          'Estatisticas', Icons.bar_chart),
                                      value: AcoesUnidade.estatisticas,
                                    ),
                                  ],
                                ),
                                title: Text(
                                  widget.unidade.estruturaOrganizacional
                                      .codigoENome,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
