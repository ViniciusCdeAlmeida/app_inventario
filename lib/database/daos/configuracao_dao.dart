import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'configuracao_dao.g.dart';

@UseDao(tables: [PrefixoDB, MascaraNumeroPatrimonialDB])

/// Classe responsável por gerar as operações de banco de dados das tabelas [PrefixoDB] e [MascaraNumeroPatrimonialDB].
class ConfiguracaoDao extends DatabaseAccessor<AppDatabase>
    with _$ConfiguracaoDaoMixin {
  final AppDatabase db;

  ConfiguracaoDao(this.db) : super(db);

  /// Método responsável por inserir um prefixo no banco de dados.
  Future<void> insertPrefixo(String prefixo) async => into(prefixoDB).insert(
        PrefixoDBCompanion(
          prefixo: Value(prefixo),
        ),
      );

  /// Método responsável por inserir uma máscara no banco de dados.
  Future insertMascara(String mascara) async =>
      into(mascaraNumeroPatrimonialDB).insert(
        MascaraNumeroPatrimonialDBCompanion(
          mascara: Value(mascara),
        ),
      );

  /// Método responsável por buscar o prefixo.
  Future<PrefixoDBData> getPrefixo() => (select(db.prefixoDB)).getSingle();

  /// Método responsável por buscar a máscara.
  Future<MascaraNumeroPatrimonialDBData> getMascara() =>
      (select(db.mascaraNumeroPatrimonialDB)).getSingle();

  /// Método responsável por atualizar o prefixo.
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

  /// Método responsável por atualizar a máscara.
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
