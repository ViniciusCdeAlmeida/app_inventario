import 'package:app_inventario/models/serialized/levantamento.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/screens/unidade/unidade_tela.dart';
import 'package:app_inventario/stores/levantamento_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LevantamentoFisicoItem extends StatefulWidget {
  final Levantamento levantamento;

  LevantamentoFisicoItem(this.levantamento);
  @override
  _LevantamentoFisicoItemState createState() => _LevantamentoFisicoItemState();
}

class _LevantamentoFisicoItemState extends State<LevantamentoFisicoItem>
    with TickerProviderStateMixin {
  // ignore: unused_field
  AnimationController _controller, _controllerCard;
  LevantamentoStore _levantamentoStore;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
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
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0, 0),
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
    var _conexao = Provider.of<Autenticacao>(context, listen: false);
    int totalBens = widget.levantamento.quantidadeTotalBensBaixados +
        widget.levantamento.quantidadeTotalBensTratados +
        widget.levantamento.quantidadeTotalBensSemInconsistencia +
        widget.levantamento.quantidadeTotalBens +
        widget.levantamento.quantidadeTotalBensEmInconsistencia;
    return AnimatedBuilder(
      animation: _controllerCard,
      builder: (context, child) => SlideTransition(
        position: _slideAnimation,
        child: child,
      ),
      child: Column(
        children: [
          Card(
            elevation: 5.0,
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
                  padding: const EdgeInsets.all(20),
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
                                              .atualizaInventarios(
                                            _conexao.atualConexao,
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
