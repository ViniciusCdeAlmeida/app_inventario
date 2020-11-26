import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:app_inventario/providers/index.dart';
import 'package:app_inventario/stores/index.dart';

List<SingleChildWidget> providers() => [
      Provider(
        create: (ctx) => Autenticacao(),
      ),
      Provider(
        create: (ctx) => Configuracao(),
      ),
      Provider(
        create: (ctx) => Conexoes(),
      ),
      Provider(
        create: (ctx) => ConexaoStore(Conexoes()),
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
      ProxyProvider<Autenticacao, Inventarios>(
        create: (context) => Inventarios(),
        update: (ctx, autenticacao, _) => Inventarios(
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
          Inventarios(),
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
      Provider(
        create: (ctx) => ConfiguracaoStore(
          Configuracao(),
        ),
      ),
      Provider(
        create: (ctx) => InventarioStore(
          Inventarios(),
          EstruturaLevantamento(),
        ),
      ),
    ];
