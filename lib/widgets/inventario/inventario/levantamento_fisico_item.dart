import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:app_inventario/models/serialized/index.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/screens/index.dart';
import 'package:app_inventario/stores/index.dart';

class LevantamentoFisicoItem extends StatefulWidget {
  final Inventario levantamento;

  LevantamentoFisicoItem(this.levantamento);
  @override
  _LevantamentoFisicoItemState createState() => _LevantamentoFisicoItemState();
}

class _LevantamentoFisicoItemState extends State<LevantamentoFisicoItem>
    with TickerProviderStateMixin {
  // ignore: unused_field
  AnimationController _controller, _controllerCard;
  LevantamentoStore _levantamentoStore;
  // Animation<Offset> _slideAnimation;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1300,
      ),
    );
    _controllerCard = AnimationController(
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
    //     parent: _controllerCard,
    //     curve: Curves.ease,
    //   ),
    // );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controllerCard,
        curve: Curves.ease,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Future.delayed(const Duration(seconds: 2), () =>
      _controllerCard.forward();
      // );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerCard.dispose();
    super.dispose();
  }

  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    _levantamentoStore = Provider.of<LevantamentoStore>(context, listen: false);
    int totalBens = widget.levantamento.quantidadeTotalBensBaixados +
        widget.levantamento.quantidadeTotalBensTratados +
        widget.levantamento.quantidadeTotalBensSemInconsistencia +
        widget.levantamento.quantidadeTotalBens +
        widget.levantamento.quantidadeTotalBensEmInconsistencia;
    return AnimatedBuilder(
      animation: _controllerCard,
      builder: (context, child) => FadeTransition(
        opacity: _fadeAnimation,
        child: child,
      ),
      child: Column(
        children: [
          Card(
            elevation: 1.0,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      (_expanded ? Icons.expand_less : Icons.expand_more),
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                  subtitle: Text(widget.levantamento.codigo),
                  title: Text(widget.levantamento.nome),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        UnidadeTela.routeName,
                        arguments: TelaArgumentos(
                          id: widget.levantamento.id,
                          arg1: widget.levantamento.nome,
                        ),
                      );
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: _expanded ? 168 : 0,
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Observer(
                          builder: (_) {
                            if (!_levantamentoStore.atualizandoInv) {
                              return Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(widget.levantamento
                                          .dominioStatusInventario.descricao),
                                      Text(
                                          'Qtde. estruturas: ${widget.levantamento.quantidadeEstruturas}'),
                                      Text('Total de itens: $totalBens'),
                                      Text(
                                          'Qtde. bens Não Informados: ${widget.levantamento.quantidadeTotalBens}'),
                                      Text(
                                          'Qtde. bens Em Inconsistência: ${widget.levantamento.quantidadeTotalBensEmInconsistencia}'),
                                      Text(
                                          'Qtde. bens Sem Inconsistência: ${widget.levantamento.quantidadeTotalBensSemInconsistencia}'),
                                      Text(
                                          'Qtde. bens Tratados: ${widget.levantamento.quantidadeTotalBensTratados}'),
                                      Text(
                                          'Qtde. bens Baixados: ${widget.levantamento.quantidadeTotalBensBaixados}'),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 65.0),
                                    child: IconButton(
                                        icon: Icon(Icons.refresh),
                                        onPressed: () {
                                          _levantamentoStore
                                              .atualizaLevantamentos(
                                            widget.levantamento.id,
                                          );
                                        }),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      )
                    ],
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
