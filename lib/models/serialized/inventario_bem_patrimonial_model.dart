import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventario_bem_patrimonial_model.g.dart';

/// Modelo para o objeto [InventarioBemPatrimonial].
@JsonSerializable()
class InventarioBemPatrimonial {
  int id;
  int idDadosBemPatrimonialMobile;
  int idInventarioEstruturaOrganizacionalMobile;
  int idUnidadeOrganizacional;
  int idDominioSituacaoFisica;
  int idDominioStatus;
  int identificaoPatrimonial;
  int idEstruturaOrganizacionalAtual;
  int idMaterial;
  String numeroPatrimonial;
  String numeroPatrimonialAntigo;
  String numeroPatrimonialNovo;
  String nomeUsuarioColeta;
  String tipoMobile;
  bool novoBemInvetariado;
  bool enviado = false;
  bool bemNaoEncontrado;
  bool bemNaoInventariado;
  List<Caracteristicas> caracteristicas;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  Dominio dominioStatusInventarioBem;
  Material material;

  InventarioBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.caracteristicas,
    this.bemNaoEncontrado,
    this.bemNaoInventariado,
    this.dominioStatusInventarioBem,
    this.idDadosBemPatrimonialMobile,
    this.idInventarioEstruturaOrganizacionalMobile,
    this.material,
    this.nomeUsuarioColeta,
    this.novoBemInvetariado,
    this.tipoMobile,
    this.enviado,
    this.idUnidadeOrganizacional,
    this.idDominioSituacaoFisica,
    this.idDominioStatus,
    this.identificaoPatrimonial,
    this.idEstruturaOrganizacionalAtual,
    this.idMaterial,
  });

  factory InventarioBemPatrimonial.fromJson(Map<String, dynamic> json) =>
      _$InventarioBemPatrimonialFromJson(json);

  Map<String, dynamic> toJson() => _$InventarioBemPatrimonialToJson(this);
}
