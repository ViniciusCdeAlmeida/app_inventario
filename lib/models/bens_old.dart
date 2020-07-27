import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bens_old.g.dart';

abstract class BensOLD implements Built<BensOLD, BensOLDBuilder> {
  static Serializer<BensOLD> get serializer => _$bensOLDSerializer;

  int get id;

  @nullable
  String get descricaoDominioSituacaoFisica;

  @nullable
  String get codigoEstrutura;

  @nullable
  int get idEstutura;

  @nullable
  String get descricaoMaterial;

  @nullable
  String get nomeEstrutura;

  @nullable
  String get numeroPatrimonial;

  @nullable
  String get descricaoDominioStatus;

  BensOLD._();

  factory BensOLD([updates(BensOLDBuilder b)]) = _$BensOLD;
}
