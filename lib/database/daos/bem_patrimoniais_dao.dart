import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'bem_patrimoniais_dao.g.dart';

@UseDao(tables: [BensPatrimoniaisDB])

/// Classe responsável por gerar as operações de banco de dados da tabela [BensPatrimoniaisDB].
class BemPatrimoniaisDao extends DatabaseAccessor<AppDatabase>
    with _$BemPatrimoniaisDaoMixin {
  final AppDatabase db;

  BemPatrimoniaisDao(this.db) : super(db);

  /// Método responsável por buscar todos os bens patrimoniais.
  Future<List<BensPatrimoniaisDBData>> getAllBensPatrimoniais() =>
      select(db.bensPatrimoniaisDB).get();

  /// Método responsável por buscar um bem patrimonial dado um [numeroPatrimonialCompleto].
  Future<BensPatrimoniaisDBData> getBemPatrimonial(
          String numeroPatrimonialCompleto) =>
      (select(db.bensPatrimoniaisDB)
            ..where((tbl) => tbl.numeroPatrimonialCompleto
                .equals(numeroPatrimonialCompleto)))
          .getSingle();

  /// Método responsável por verificar a existência de bens patrimoniais.
  Future<BensPatrimoniaisDBData> getVerificaBensPatrimoniais() =>
      (select(db.bensPatrimoniaisDB)..limit(1)).getSingle();

  /// Método responsável por atualizar um bem patrimonial [idBemPatrimonial] marcando-o como inventariado.
  Future<void> updateBemPatrimonial(int idBemPatrimonial) =>
      (update(db.bensPatrimoniaisDB)
            ..where(
              (tbl) => tbl.id.equals(idBemPatrimonial),
            ))
          .write(
        BensPatrimoniaisDBCompanion(
          inventariado: Value(true),
        ),
      );

  /// Método responsável por inserir uma lista [bensPatrimoniais] de bens patrimoniais no banco de dados.
  Future<void> insertBensPatrimoniais(List bensPatrimoniais) async =>
      await batch(
        (l) {
          l.insertAll(
            db.bensPatrimoniaisDB,
            bensPatrimoniais.map((e) {
              List<Caracteristicas> caracteristicas =
                  (e['caracteristicas'] as List)
                      .map((i) => Caracteristicas.fromJson(i))
                      .toList();
              return BensPatrimoniaisDBCompanion(
                id: Value(e['id']),
                numeroPatrimonial: Value(e['numeroPatrimonial']),
                numeroPatrimonialCompleto:
                    Value(e['numeroPatrimonialCompleto']),
                numeroPatrimonialCompletoAntigo:
                    Value(e['numeroPatrimonialCompletoAntigo']),
                dominioSituacaoFisica: Value(
                  Dominio.fromJson(e['dominioSituacaoFisica']),
                ),
                dominioStatus: Value(
                  Dominio.fromJson(e['dominioStatus']),
                ),
                estruturaOrganizacionalAtual: Value(
                  Organizacao.fromJson(e['estruturaOrganizacionalAtual']),
                ),
                material: Value(
                  Material.fromJson(e['material']),
                ),
                caracteristicas: caracteristicas != null
                    ? Value(caracteristicas)
                    : Value(null),
              );
            }).toList(),
          );
        },
      );
}
