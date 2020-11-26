import 'package:moor/moor.dart';

class MascaraNumeroPatrimonialDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mascara => text().nullable()();
}
