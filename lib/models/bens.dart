import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bens.g.dart';

abstract class Bens implements Built<Bens, BensBuilder> {
  static Serializer<Bens> get serializer => _$bensSerializer;

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

  Bens._();

  factory Bens([updates(BensBuilder b)]) = _$Bens;
}
