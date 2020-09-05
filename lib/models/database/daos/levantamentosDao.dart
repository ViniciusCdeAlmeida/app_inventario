import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'levantamentosDao.g.dart';

@UseDao(tables: [LevantamentoDB])
class LevantamentosDao extends DatabaseAccessor<AppDatabase>
    with _$LevantamentosDaoMixin {
  final AppDatabase db;

  LevantamentosDao(this.db) : super(db);

  Future<List<LevantamentoDBData>> getAllLevantamentos(int idOrganizacao) =>
      (select(db.levantamentoDB)
            ..where((tbl) => tbl.idOrganizacao.equals(idOrganizacao)))
          .get();

  Future<LevantamentoDBData> getVerificaLevantamentos() =>
      (select(db.levantamentoDB)..limit(1)).getSingle();

  Future<void> insertLevantamentos(List levantamentos) async {
    await batch(
      (l) {
        l.insertAll(
          db.levantamentoDB,
          levantamentos.map((e) {
            return LevantamentoDBCompanion(
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
}
