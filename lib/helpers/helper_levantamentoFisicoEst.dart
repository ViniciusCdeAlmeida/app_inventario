import 'package:app_inventario/helpers/helper_dadosBemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_estruturaOrganizacional.dart';
import 'package:app_inventario/helpers/helper_levantamento.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';

List<EstruturaInventarioNew> helperEstruturaInventarioEst(
    List listaEstruturas, List<Dominio> listaDominios) {
  return List<EstruturaInventarioNew>.from(
    (listaEstruturas).map(
      (item) => EstruturaInventarioNew(
        id: item['id'],
        dominioStatusInventarioEstrutura:
            item['dominioStatusInventarioEstrutura'] != null
                ? helperDominio(item['dominioStatusInventarioEstrutura'])
                : null,
        idInventario: item['idInventario'],
        estruturaOrganizacional:
            helperEstruturaOrganizacional(item['estruturaOrganizacional']),
        inventario: helperLevantamento(item['inventario']),
        dadosBensPatrimoniais: (item['dadosBensPatrimoniais'] as List<dynamic>)
            .map(
              (dadosBens) =>
                  helperDadosBensPatrimoniaisEst(dadosBens, listaDominios),
            )
            .toList(),
      ),
    ),
  );
}
