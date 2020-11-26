import 'package:app_inventario/custom/custom_bensPrevistos.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:app_inventario/screens/bens/ler_bens_geral_tela.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrevistosBensItem extends StatefulWidget {
  DadosBensPatrimoniais bemInventario;
  String idInventarioEstrutura;

  PrevistosBensItem({@required this.bemInventario, this.idInventarioEstrutura});

  @override
  _PrevistosBensItemState createState() => _PrevistosBensItemState();
}

class _PrevistosBensItemState extends State<PrevistosBensItem>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => FadeTransition(
        // position: _slideAnimation,
        opacity: _fadeAnimation,
        child: child,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.bemInventario.idInventario == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.red[800],
                        ),
                        Text(
                          'O item foi inventariado fora do espelho do inventário.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                BensPrevistos(
                  'Número Patrimonial: ',
                  widget.bemInventario.numeroPatrimonial != null
                      ? widget.bemInventario.numeroPatrimonial
                      : widget.bemInventario.inventarioBemPatrimonial
                          .numeroPatrimonial,
                ),
                BensPrevistos(
                  'Descrição do material: ',
                  widget.bemInventario.material != null
                      ? widget.bemInventario.material.codigoEDescricao
                      : null,
                ),
                BensPrevistos(
                    'Situação fisica: ',
                    widget.bemInventario.dominioSituacaoFisica != null
                        ? widget.bemInventario.dominioSituacaoFisica.descricao
                        : widget.bemInventario.inventarioBemPatrimonial
                                    .dominioSituacaoFisica !=
                                null
                            ? widget.bemInventario.inventarioBemPatrimonial
                                .dominioSituacaoFisica.descricao
                            : 'Não contem'),
                BensPrevistos(
                    'Status do bem: ',
                    widget.bemInventario.dominioStatus != null
                        ? widget.bemInventario.dominioStatus.descricao
                        : widget.bemInventario.inventarioBemPatrimonial
                                    .dominioStatus !=
                                null
                            ? widget.bemInventario.inventarioBemPatrimonial
                                .dominioStatus.descricao
                            : 'Não contem'),
                BensPrevistos(
                    'Status no Inventario: ',
                    widget.bemInventario.dominioStatusInventarioBem != null
                        ? widget
                            .bemInventario.dominioStatusInventarioBem.descricao
                        : null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: !widget.bemInventario.inventariado
                          ? Icon(Icons.content_paste)
                          : Icon(Icons.check),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          LerBensGeralTela.routeName,
                          arguments: TelaArgumentos(
                            id: int.parse(widget.idInventarioEstrutura),
                            arg1: widget.bemInventario
                                        .numeroPatrimonialCompleto !=
                                    null
                                ? widget.bemInventario.numeroPatrimonialCompleto
                                : widget.bemInventario.inventarioBemPatrimonial
                                    .numeroPatrimonial,
                            arg2: widget.bemInventario.idInventario.toString(),
                            arg3: widget.bemInventario.idBemPatrimonial
                                .toString(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
