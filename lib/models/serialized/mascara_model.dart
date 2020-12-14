import 'package:json_annotation/json_annotation.dart';

part 'mascara_model.g.dart';

@JsonSerializable()
class Mascara {
  final int id;
  final String mascara;

  Mascara({
    this.id,
    this.mascara,
  });

  factory Mascara.fromJson(Map<String, dynamic> json) =>
      _$MascaraFromJson(json);

  Map<String, dynamic> toJson() => _$MascaraToJson(this);
}
