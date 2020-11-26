import 'package:app_inventario/models/serialized/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  final int id;
  final String username;
  final List<Organizacoes> organizacoes;

  Login({
    this.id,
    this.username,
    this.organizacoes,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
