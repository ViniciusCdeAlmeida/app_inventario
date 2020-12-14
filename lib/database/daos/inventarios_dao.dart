import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/extensions/json1.dart';

part 'inventarios_dao.g.dart';

@UseDao(tables: [InventarioDB])
class InventariosDao extends DatabaseAccessor<AppDatabase>
    with _$InventariosDaoMixin {
  final AppDatabase db;

  InventariosDao(this.db) : super(db);

  Future<List<InventarioDBData>> getAllLevantamentos(int idOrganizacao) =>
      (select(db.inventarioDB)
            ..where((tbl) =>
                tbl.idOrganizacao.equals(idOrganizacao) &
                tbl.dominioTipoInventario
                    .jsonExtract<int>(r'$.codigo')
                    .equals(2) &
                tbl.dominioTipoInventario
                    .jsonExtract<String>(r'$.chave')
                    .equals('tipoInventario')))
          .get();

  Future<List<InventarioDBData>> getAllInventarios(int idOrganizacao) =>
      (select(db.inventarioDB)
            ..where((tbl) =>
                tbl.idOrganizacao.equals(idOrganizacao) &
                tbl.dominioTipoInventario
                    .jsonExtract<int>(r'$.codigo')
                    .equals(5) &
                tbl.dominioTipoInventario
                    .jsonExtract<String>(r'$.chave')
                    .equals('tipoInventario')))
          .get();

  Future<InventarioDBData> getLevantamento(int id) =>
      (select(db.inventarioDB)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<InventarioDBData> getInventario(int id) =>
      (select(db.inventarioDB)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<InventarioDBData> getVerificaLevantamentos() =>
      (select(db.inventarioDB)
            ..limit(1)
            ..where((tbl) =>
                tbl.dominioTipoInventario
                    .jsonExtract<int>(r'$.codigo')
                    .equals(2) &
                tbl.dominioTipoInventario
                    .jsonExtract<String>(r'$.chave')
                    .equals('tipoInventario')))
          .getSingle();

  Future<InventarioDBData> getVerificaTipoInventario(int id) =>
      (select(db.inventarioDB)
            ..limit(1)
            ..where((tbl) =>
                tbl.dominioTipoInventario
                    .jsonExtract<int>(r'$.codigo')
                    .equals(2) &
                tbl.id.equals(id)))
          .getSingle();

  Future<InventarioDBData> getVerificaInventarios() => (select(db.inventarioDB)
        ..limit(1)
        ..where((tbl) =>
            tbl.dominioTipoInventario.jsonExtract<int>(r'$.codigo').equals(5) &
            tbl.dominioTipoInventario
                .jsonExtract<String>(r'$.chave')
                .equals('tipoInventario')))
      .getSingle();

  void deletarLevantamentos(Table database) async => delete(database);

  Future<void> updateAtualizaDados(Inventario inventario) =>
      (update(db.inventarioDB)
            ..where(
              (tbl) => tbl.id.equals(inventario.id),
            ))
          .write(
        InventarioDBCompanion(
          quantidadeTotalBensBaixados:
              Value(inventario.quantidadeTotalBensBaixados),
          quantidadeTotalBensEmInconsistencia:
              Value(inventario.quantidadeTotalBensEmInconsistencia),
          quantidadeTotalBensSemInconsistencia:
              Value(inventario.quantidadeTotalBensSemInconsistencia),
          quantidadeTotalBensTratados:
              Value(inventario.quantidadeTotalBensTratados),
          quantidadeTotalBens: Value(inventario.quantidadeTotalBens),
        ),
      );

  Future<void> insertLevantamentos(List levantamentos) async => await batch(
        (l) {
          l.insertAll(
            db.inventarioDB,
            levantamentos.map((e) {
              return InventarioDBCompanion(
                id: Value(e['id']),
                codigo: Value(e['codigo']),
                codigoENome: Value(e['codigoENome']),
                dominioStatusInventario: Value(
                  Dominio.fromJson(e['dominioStatusInventario']),
                ),
                dominioTipoInventario: Value(
                  Dominio.fromJson(e['dominioTipoInventario']),
                ),
                idOrganizacao: Value(e['idOrganizacao']),
                nome: Value(e['nome']),
                quantidadeEstruturas: Value(e['quantidadeEstruturas']),
                quantidadeTotalBens: Value(e['quantidadeTotalBens']),
                quantidadeTotalBensBaixados:
                    Value(e['quantidadeTotalBensBaixados']),
                quantidadeTotalBensEmInconsistencia:
                    Value(e['quantidadeTotalBensEmInconsistencia']),
                quantidadeTotalBensSemInconsistencia:
                    Value(e['quantidadeTotalBensSemInconsistencia']),
                quantidadeTotalBensTratados:
                    Value(e['quantidadeTotalBensTratados']),
              );
            }).toList(),
          );
        },
      );
}
