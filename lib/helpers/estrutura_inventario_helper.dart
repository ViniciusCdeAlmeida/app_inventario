import 'dart:convert';

import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';

List<EstruturaInventario> helperEstruturaInventarioLista(
    List<EstruturaInventarioDBData> listaUnidades) {
  return List<EstruturaInventario>.from(
    (listaUnidades).map(
      (item) => EstruturaInventario(
          id: item.id,
          dominioStatusInventarioEstrutura:
              item.dominioStatusInventarioEstrutura,
          estruturaOrganizacional: item.estruturaOrganizacional,
          idInventario: item.idInventario),
    ),
  );
}

EstruturaInventario helperEstruturaInventario(Map estrutura) {
  return EstruturaInventario(
      id: estrutura['id'],
      dominioStatusInventarioEstrutura: Dominio.fromJson(
        json.decode(estrutura['dominio_status_inventario_estrutura']),
      ),
      estruturaOrganizacional: Organizacao.fromJson(
        json.decode(estrutura['estrutura_organizacional']),
      ),
      idInventario: estrutura['id_inventario']);
}
