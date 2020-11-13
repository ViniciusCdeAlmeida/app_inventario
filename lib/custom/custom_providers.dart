import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:app_inventario/providers/autenticacao.dart';
import 'package:app_inventario/providers/bensProvider.dart';
import 'package:app_inventario/providers/configuracao_conexao.dart';
import 'package:app_inventario/providers/estruturaLevantamento.dart';
import 'package:app_inventario/providers/inicializacao.dart';
import 'package:app_inventario/providers/inventario.dart';
import 'package:app_inventario/providers/inventarioBemPatrimonial.dart';
import 'package:app_inventario/providers/levantamentos.dart';
import 'package:app_inventario/stores/bemPatrimonial_store.dart';
import 'package:app_inventario/stores/bensInventariados_store.dart';
import 'package:app_inventario/stores/bensPrevistos_store.dart';
import 'package:app_inventario/stores/estruturaLevantamento_store.dart';
import 'package:app_inventario/stores/inicializacao_store.dart';
import 'package:app_inventario/stores/levantamento_store.dart';
import 'package:app_inventario/stores/login_store.dart';

List<SingleChildWidget> providers() => [
      Provider(
        create: (ctx) => Autenticacao(),
      ),
      Provider(
        create: (ctx) => ConfiguracaoConexao(),
      ),
      Provider(
        create: (ctx) => Inventario(),
      ),
      Provider(
        create: (ctx) => BensProvider(),
      ),
      Provider(
        create: (ctx) => Inicializacao(),
      ),
      Provider(
        create: (ctx) => InventarioBensPatrimoniais(),
      ),
      Provider(
        create: (ctx) => EstruturaLevantamento(),
      ),
      ProxyProvider<Autenticacao, Levantamentos>(
        create: (context) => Levantamentos(),
        update: (ctx, autenticacao, _) => Levantamentos(
          idOrganizacao: autenticacao.idUnidade,
        ),
      ),
      Provider(
        create: (ctx) => InicializacaoStore(
          Inicializacao(),
          Autenticacao(),
        ),
      ),
      Provider(
        create: (ctx) => LevantamentoStore(
          Levantamentos(),
          EstruturaLevantamento(),
        ),
      ),
      Provider(
        create: (ctx) => EstruturaLevantamentoStore(
          EstruturaLevantamento(),
        ),
      ),
      Provider(
        create: (ctx) => BensPrevistosStore(
          BensProvider(),
        ),
      ),
      Provider(
        create: (ctx) => BensInventariadoStore(
          InventarioBensPatrimoniais(),
        ),
      ),
      Provider(
        create: (ctx) => LoginStore(
          Autenticacao(),
          ConfiguracaoConexao(),
        ),
      ),
      Provider(
        create: (ctx) => BemPatrimonialStore(
          BensProvider(),
          EstruturaLevantamento(),
          Inicializacao(),
          InventarioBensPatrimoniais(),
        ),
      ),
    ];
