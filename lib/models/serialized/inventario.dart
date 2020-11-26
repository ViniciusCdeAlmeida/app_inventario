import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventario.g.dart';

@JsonSerializable()
class Inventario {
  final int id;
  final Dominio dominioTipoInventario;
  final Dominio dominioStatusInventario;
  final String codigoENome;
  final String nome;
  final String codigo;
  final int quantidadeEstruturas;
  final int quantidadeTotalBens;
  final int quantidadeTotalBensTratados;
  final int quantidadeTotalBensEmInconsistencia;
  final int quantidadeTotalBensSemInconsistencia;
  final int quantidadeTotalBensBaixados;
  final int idOrganizacao;

  Inventario({
    this.id,
    this.dominioTipoInventario,
    this.dominioStatusInventario,
    this.codigoENome,
    this.codigo,
    this.nome,
    this.quantidadeEstruturas,
    this.quantidadeTotalBens,
    this.quantidadeTotalBensTratados,
    this.quantidadeTotalBensSemInconsistencia,
    this.quantidadeTotalBensEmInconsistencia,
    this.quantidadeTotalBensBaixados,
    this.idOrganizacao,
  });

  factory Inventario.fromJson(Map<String, dynamic> json) =>
      _$InventarioFromJson(json);

  Map<String, dynamic> toJson() => _$InventarioToJson(this);
}
