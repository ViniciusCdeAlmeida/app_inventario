import 'package:app_inventario/models/organizacao.dart';
import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/unidade.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:app_inventario/widgets/unidade/unidade_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnidadeTela extends StatefulWidget {
  static const routeName = '/unidadeTela';
  List<Organizacao> unidades;
  @override
  _UnidadeTelaState createState() => _UnidadeTelaState();
}

class _UnidadeTelaState extends State<UnidadeTela> {
  var _isLoading = false;
  bool _disposed = false;

  @override
  void didChangeDependencies() {
    final conexao =
        Provider.of<Autenticacao>(context, listen: false).atualConexao;
    final idInventario = ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration.zero).then((_) async {
      if (!_disposed) {
        setState(() {
          _isLoading = true;
        });
      }
      await Provider.of<Unidades>(context, listen: false)
          .buscaEstruturasLevantamento(idInventario, conexao);

      if (!_disposed) {
        setState(() {
          _isLoading = false;
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unidadesData =
        Provider.of<Unidades>(context, listen: false).getUnidades;
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              // shrinkWrap: false,
              slivers: <Widget>[
                SliverAppBar(
                  title: AppDrawer(),
                  floating: true,
                  snap: true,
                  // expandedHeight: 210.0,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, idx) => UnidadeItem(unidadesData[idx]),
                      childCount: unidadesData.length),
                ),
              ],
            ),
    );
  }
}
