import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'configuracao_dao.g.dart';

@UseDao(tables: [
  PrefixoDB,
  MascaraNumeroPatrimonialDB,
])
class ConfiguracaoDao extends DatabaseAccessor<AppDatabase>
    with _$ConfiguracaoDaoMixin {
  final AppDatabase db;

  ConfiguracaoDao(this.db) : super(db);

  Future<void> insertPrefixo(String prefixo) async => into(prefixoDB).insert(
        PrefixoDBCompanion(
          prefixo: Value(prefixo),
        ),
      );

  Future insertMascara(String mascara) async =>
      into(mascaraNumeroPatrimonialDB).insert(
        MascaraNumeroPatrimonialDBCompanion(
          mascara: Value(mascara),
        ),
      );

  Future<PrefixoDBData> getPrefixo() => (select(db.prefixoDB)).getSingle();

  Future<MascaraNumeroPatrimonialDBData> getMascara() =>
      (select(db.mascaraNumeroPatrimonialDB)).getSingle();

  Future updatePrefixo(String prefixo, int id) {
    return (update(prefixoDB)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .write(
      PrefixoDBCompanion(
        prefixo: Value(prefixo == "" ? null : prefixo),
      ),
    );
  }

  Future updateMascara(String mascara, int id) =>
      (update(mascaraNumeroPatrimonialDB)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .write(
        MascaraNumeroPatrimonialDBCompanion(
          mascara: Value(mascara == "" ? null : mascara),
        ),
      );
}
