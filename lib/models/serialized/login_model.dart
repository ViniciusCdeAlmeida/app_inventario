import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

/// Modelo para o objeto [Login].
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
