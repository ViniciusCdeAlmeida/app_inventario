import 'package:GRPInventario/models/serialized/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estruturaInventario.g.dart';

@JsonSerializable()
class EstruturaInventario {
  final int id;
  final Organizacao estruturaOrganizacional;
  final Dominio dominioStatusInventarioEstrutura;
  final int idInventario;

  EstruturaInventario({
    this.id,
    this.estruturaOrganizacional,
    this.dominioStatusInventarioEstrutura,
    this.idInventario,
  });

  factory EstruturaInventario.fromJson(Map<String, dynamic> json) =>
      _$EstruturaInventarioFromJson(json);

  Map<String, dynamic> toJson() => _$EstruturaInventarioToJson(this);
}
