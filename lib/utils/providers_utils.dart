import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:GRPInventario/providers/index_providers.dart';
import 'package:GRPInventario/components/stores/index_store.dart';

List<SingleChildWidget> providers() => [
      Provider(
        create: (ctx) => AutenticacaoProvider(),
      ),
      Provider(
        create: (ctx) => ConfiguracaoProvider(),
      ),
      Provider(
        create: (ctx) => ConexoesProvider(),
      ),
      Provider(
        create: (ctx) => ConexaoStore(ConexoesProvider()),
      ),
      Provider(
        create: (ctx) => TipoInventarioProvider(),
      ),
      Provider(
        create: (ctx) => BensProvider(),
      ),
      Provider(
        create: (ctx) => InicializacaoProvider(),
      ),
      Provider(
        create: (ctx) => InventarioBensPatrimoniaisProvider(),
      ),
      Provider(
        create: (ctx) => EstruturaLevantamentoProvider(),
      ),
      ProxyProvider<AutenticacaoProvider, InventariosProvider>(
        create: (context) => InventariosProvider(),
        update: (ctx, autenticacao, _) => InventariosProvider(
          idOrganizacao: autenticacao.idUnidade,
        ),
      ),
      Provider(
        create: (ctx) => InicializacaoStore(
          InicializacaoProvider(),
          AutenticacaoProvider(),
        ),
      ),
      Provider(
        create: (ctx) => LevantamentoStore(
          InventariosProvider(),
          EstruturaLevantamentoProvider(),
        ),
      ),
      Provider(
        create: (ctx) => EstruturaLevantamentoStore(
          EstruturaLevantamentoProvider(),
        ),
      ),
      Provider(
        create: (ctx) => BensPrevistosStore(
          BensProvider(),
        ),
      ),
      Provider(
        create: (ctx) => BensInventariadoStore(
          InventarioBensPatrimoniaisProvider(),
        ),
      ),
      Provider(
        create: (ctx) => LoginStore(
          AutenticacaoProvider(),
        ),
      ),
      Provider(
        create: (ctx) => BemPatrimonialStore(
          BensProvider(),
          EstruturaLevantamentoProvider(),
          InicializacaoProvider(),
          InventarioBensPatrimoniaisProvider(),
        ),
      ),
      Provider(
        create: (ctx) => ConfiguracaoStore(
          ConfiguracaoProvider(),
        ),
      ),
      Provider(
        create: (ctx) => InventarioStore(
          InventariosProvider(),
          EstruturaLevantamentoProvider(),
        ),
      ),
    ];
