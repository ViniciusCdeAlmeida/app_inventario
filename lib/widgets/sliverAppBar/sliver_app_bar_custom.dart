import 'package:GRPInventario/providers/stores/index_store.dart';
import 'package:GRPInventario/utils/index_utils.dart';
import 'package:GRPInventario/widgets/index_widget.dart';
import 'package:GRPInventario/widgets/sliverAppBar/sliver_app_bar_custom_classificacao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverAppBarCustom extends StatefulWidget {
  final String titulo;
  final String tipoMenu;
  final Function limpar;
  final Function filtro;
  final Function ordenacao;

  SliverAppBarCustom({
    this.titulo,
    this.filtro,
    this.limpar,
    this.tipoMenu,
    this.ordenacao,
  });

  @override
  _SliverAppBarCustomState createState() => _SliverAppBarCustomState();
}

class _SliverAppBarCustomState extends State<SliverAppBarCustom>
    with TickerProviderStateMixin {
  SliverAppBarCustomClassificacaoStore _sliverAppBarCustomClassificacaoStore;
  bool _search = false;
  int _selecionadoTodos;

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    _sliverAppBarCustomClassificacaoStore
        .limpaOrdencao(Dominios.ordenacaoTodos);
    super.dispose();
  }

  Widget limpaMenu() {
    return IconButton(
      alignment: Alignment.bottomLeft,
      icon: Icon(Icons.arrow_forward),
      onPressed: () {
        widget.limpar();
        _controller.text = '';
        _sliverAppBarCustomClassificacaoStore
            .limpaOrdencao(Dominios.ordenacaoTodos);
        setState(() {
          _search = false;
        });
      },
    );
  }

  void _redirecionamento(AcoesMenu acoes) {
    switch (acoes) {
      case AcoesMenu.ordernarPor:
        showDialog(
          context: context,
          builder: (context) {
            return SliverAppBarCustomClassificacao(
              tipoMenu: widget.tipoMenu,
              ordenacao: widget.ordenacao,
              limpaSelecionado: _selecionadoTodos,
            );
          },
        );
        break;
      case AcoesMenu.pesquisar:
        setState(() {
          _search = true;
        });
        break;
    }
  }

  Widget menuEstruturas() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: ListTile(
        trailing: PopupMenuButton<AcoesMenu>(
          key: Key('menu_button_${widget.tipoMenu}'),
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onSelected: (value) {
            _redirecionamento(value);
          },
          padding: const EdgeInsets.only(right: 10),
          offset: Offset(0, 100),
          itemBuilder: (context) => <PopupMenuEntry<AcoesMenu>>[
            PopupMenuItem<AcoesMenu>(
              key: Key('pesquisar_${widget.tipoMenu}'),
              child: PopupMenuCustom('Pesquisar', Icons.search_outlined),
              value: AcoesMenu.pesquisar,
            ),
            const PopupMenuDivider(),
            PopupMenuItem<AcoesMenu>(
              key: Key('ordernar_por_${widget.tipoMenu}'),
              child: PopupMenuCustom(
                  'Ordenar por', Icons.format_list_numbered_outlined),
              value: AcoesMenu.ordernarPor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _sliverAppBarCustomClassificacaoStore =
        Provider.of<SliverAppBarCustomClassificacaoStore>(context,
            listen: false);
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
        CustomPaint(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Column(
                children: <Widget>[!_search ? menuEstruturas() : limpaMenu()],
              ),
            ],
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 10),
          transitionBuilder: (child, animation) {
            final fadeAnimation =
                CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
            if (_search) {
              return ClipRect(
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                ),
              );
            } else {
              return ClipRect(
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: child,
                ),
              );
            }
          },
          child: _search
              ? Padding(
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
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _controller.text = '';
                            widget.filtro(_controller.text);
                          },
                        ),
                        icon: Icon(Icons.search),
                        contentPadding: const EdgeInsets.only(top: 5),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      controller: _controller,
                      onEditingComplete: () => widget.filtro(_controller.text),
                      onChanged: (_) => widget.filtro(_controller.text),
                    ),
                  ),
                )
              : null,
        ),
        titlePadding: const EdgeInsetsDirectional.only(
          bottom: 3.3,
          start: 50,
          end: 50,
        ),
      ),
    );
  }
}
