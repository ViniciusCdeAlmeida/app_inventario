import 'package:moor_flutter/moor_flutter.dart';

import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';

part 'estrutura_inventario_dao.g.dart';

@UseDao(tables: [EstruturaInventarioDB])

/// Classe responsável por gerar as operações de banco de dados da tabela [EstruturaInventarioDB].
class EstruturaInventarioDao extends DatabaseAccessor<AppDatabase>
    with _$EstruturaInventarioDaoMixin {
  final AppDatabase db;

  EstruturaInventarioDao(this.db) : super(db);

  /// Método responsável por buscar as estruturas de um inventário [idInventario].
  Future<List<EstruturaInventarioDBData>> getAllEstruturasPorLevantamento(
          int idInventario) =>
      (select(db.estruturaInventarioDB)
            ..where((tbl) => tbl.idInventario.equals(idInventario)))
          .get();

  /// Método responsável por verificar a existência de estruturas.
  Future<EstruturaInventarioDBData> getVerificaEstruturasInventario() =>
      (select(db.estruturaInventarioDB)..limit(1)).getSingle();

  /// Método responsável por inserir uma lista [levantamentos] de levantamentos no banco de dados.
  Future<void> insertEstruturaInventario(List levantamentos) async =>
      await batch(
        (l) {
          l.insertAll(
            db.estruturaInventarioDB,
            levantamentos.map((e) {
              db.dadosBemPatrimoniaisDao.insertDadosBensPatrimoniais(
                  e['dadosBensPatrimoniais'] as List);
              return EstruturaInventarioDBCompanion(
                id: Value(e['id']),
                estruturaOrganizacional: Value(
                  Organizacao.fromJson(e['estruturaOrganizacional']),
                ),
                dominioStatusInventarioEstrutura:
                    e['dominioStatusInventarioEstrutura'] != null
                        ? Value(
                            Dominio.fromJson(
                                e['dominioStatusInventarioEstrutura']),
                          )
                        : Value(null),
                idInventario: Value(
                  e['idInventario'],
                ),
              );
            }).toList(),
          );
        },
      );
}
