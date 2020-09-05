import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';

List<InventarioBemPatrimonial> helperInventarioBemPatrimonialLista(
    List<InventarioBemPatrimonialDBData> listaInvetariados) {
  if (listaInvetariados != null) {
    return List<InventarioBemPatrimonial>.from(
      (listaInvetariados).map(
        (item) => InventarioBemPatrimonial(
          id: item.id,
          numeroPatrimonial: item.numeroPatrimonial,
          bemNaoEncontrado: item.bemNaoEncontrado,
          material: item.material,
          dominioSituacaoFisica: item.dominioSituacaoFisica,
          dominioStatus: item.dominioStatus,
          caracteristicas: item.caracteristicas,
          bemNaoInventariado: item.bemNaoEncontrado,
          dominioStatusInventarioBem: item.dominioStatusInventarioBem,
          enviado: item.enviado,
          idDadosBemPatrimonialMobile: item.idDadosBemPatrimonialMobile,
          idInventarioEstruturaOrganizacionalMobile:
              item.idInventarioEstruturaOrganizacionalMobile,
          idUnidadeOrganizacional: item.idUnidadeOrganizacional,
          nomeUsuarioColeta: item.nomeUsuarioColeta,
          novoBemInvetariado: item.novoBemInvetariado,
          numeroPatrimonialAntigo: item.numeroPatrimonialAntigo,
          numeroPatrimonialNovo: item.numeroPatrimonialNovo,
          tipoMobile: item.tipoMobile,
        ),
      ),
    );
  } else
    return null;
}
