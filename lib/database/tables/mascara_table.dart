import 'package:moor/moor.dart';

/// Responsável por criar a tabela [MascaraNumeroPatrimonialDB] e seus campos no banco de dados.
class MascaraNumeroPatrimonialDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mascara => text().nullable()();
}
