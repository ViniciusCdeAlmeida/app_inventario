// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levantamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Levantamento _$LevantamentoFromJson(Map<String, dynamic> json) {
  return Levantamento(
    id: json['id'] as int,
    dominioTipoInventario: json['dominioTipoInventario'] == null
        ? null
        : Dominio.fromJson(
            json['dominioTipoInventario'] as Map<String, dynamic>),
    dominioStatusInventario: json['dominioStatusInventario'] == null
        ? null
        : Dominio.fromJson(
            json['dominioStatusInventario'] as Map<String, dynamic>),
    codigoENome: json['codigoENome'] as String,
    codigo: json['codigo'] as String,
    nome: json['nome'] as String,
    quantidadeEstruturas: json['quantidadeEstruturas'] as int,
    quantidadeTotalBens: json['quantidadeTotalBens'] as int,
    quantidadeTotalBensTratados: json['quantidadeTotalBensTratados'] as int,
    quantidadeTotalBensSemInconsistencia:
        json['quantidadeTotalBensSemInconsistencia'] as int,
    quantidadeTotalBensEmInconsistencia:
        json['quantidadeTotalBensEmInconsistencia'] as int,
    quantidadeTotalBensBaixados: json['quantidadeTotalBensBaixados'] as int,
    idOrganizacao: json['idOrganizacao'] as int,
  );
}

Map<String, dynamic> _$LevantamentoToJson(Levantamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dominioTipoInventario': instance.dominioTipoInventario,
      'dominioStatusInventario': instance.dominioStatusInventario,
      'codigoENome': instance.codigoENome,
      'nome': instance.nome,
      'codigo': instance.codigo,
      'quantidadeEstruturas': instance.quantidadeEstruturas,
      'quantidadeTotalBens': instance.quantidadeTotalBens,
      'quantidadeTotalBensTratados': instance.quantidadeTotalBensTratados,
      'quantidadeTotalBensEmInconsistencia':
          instance.quantidadeTotalBensEmInconsistencia,
      'quantidadeTotalBensSemInconsistencia':
          instance.quantidadeTotalBensSemInconsistencia,
      'quantidadeTotalBensBaixados': instance.quantidadeTotalBensBaixados,
      'idOrganizacao': instance.idOrganizacao,
    };
