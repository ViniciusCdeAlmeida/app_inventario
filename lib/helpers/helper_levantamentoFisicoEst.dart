import 'package:app_inventario/helpers/helper_dadosBemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_estruturaOrganizacional.dart';
import 'package:app_inventario/models/estruturaInventarioNew.dart';

List<EstruturaInventarioNew> helperEstruturaInventarioEst(
    List listaEstruturas) {
  return List<EstruturaInventarioNew>.from(
    (listaEstruturas).map(
      (item) => EstruturaInventarioNew(
        id: item['id'],
        dominioStatusInventarioEstrutura:
            helperDominio(item['dominioStatusInventarioEstrutura']),
        idInventario: item['idInventario'],
        estruturaOrganizacional:
            helperEstruturaOrganizacional(item['estruturaOrganizacional']),
        dadosBensPatrimoniais: (item['dadosBensPatrimoniais'] as List<dynamic>)
            .map(
              (dadosBens) => helperDadosBensPatrimoniaisEst(dadosBens),
            )
            .toList(),
      ),
    ),
  );
}
