import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bem_patrimonial_model.g.dart';

/// Modelo para o objeto [BemPatrimonial].
@JsonSerializable()
class BemPatrimonial {
  int id;
  String numeroPatrimonial;
  String numeroPatrimonialCompleto;
  String numeroPatrimonialCompletoAntigo;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  Material material;
  List<Caracteristicas> caracteristicas;
  Organizacao estruturaOrganizacionalAtual;
  DadosBensPatrimoniais dadosBensPatrimoniais;
  bool inventariado;

  BemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialCompleto,
    this.numeroPatrimonialCompletoAntigo,
    this.material,
    this.caracteristicas,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.estruturaOrganizacionalAtual,
    this.dadosBensPatrimoniais,
    this.inventariado,
  });

  factory BemPatrimonial.fromJson(Map<String, dynamic> json) =>
      _$BemPatrimonialFromJson(json);

  Map<String, dynamic> toJson() => _$BemPatrimonialToJson(this);
}
