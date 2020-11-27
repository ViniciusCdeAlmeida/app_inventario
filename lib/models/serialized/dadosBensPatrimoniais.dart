import 'package:GRPInventario/models/serialized/index.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'dadosBensPatrimoniais.g.dart';

@JsonSerializable()
class DadosBensPatrimoniais {
  final int id;
  final String numeroPatrimonial;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  final Dominio dominioStatusInventarioBem;
  final int idInventario;
  final int idInventarioEstruturaOrganizacional;
  final Material material;
  InventarioDadosBemPatrimonial inventarioBemPatrimonial;
  @observable
  bool inventariado;
  final int idBemPatrimonial;
  final String numeroPatrimonialCompleto;
  final int idEstruturaOrganizacional;

  DadosBensPatrimoniais({
    this.id,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.dominioStatusInventarioBem,
    this.idInventario,
    this.idInventarioEstruturaOrganizacional,
    this.material,
    this.inventarioBemPatrimonial,
    this.numeroPatrimonial,
    this.inventariado,
    this.numeroPatrimonialCompleto,
    this.idEstruturaOrganizacional,
    this.idBemPatrimonial,
  });

  factory DadosBensPatrimoniais.fromJson(Map<String, dynamic> json) =>
      _$DadosBensPatrimoniaisFromJson(json);

  Map<String, dynamic> toJson() => _$DadosBensPatrimoniaisToJson(this);
}
