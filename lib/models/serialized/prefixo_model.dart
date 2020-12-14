import 'package:json_annotation/json_annotation.dart';

part 'prefixo_model.g.dart';

@JsonSerializable()
class Prefixo {
  final int id;
  final String prefixo;

  Prefixo({
    this.id,
    this.prefixo,
  });

  factory Prefixo.fromJson(Map<String, dynamic> json) =>
      _$PrefixoFromJson(json);

  Map<String, dynamic> toJson() => _$PrefixoToJson(this);
}
