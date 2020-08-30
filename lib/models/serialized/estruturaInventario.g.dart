// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estruturaInventario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstruturaInventario _$EstruturaInventarioFromJson(Map<String, dynamic> json) {
  return EstruturaInventario(
    id: json['id'] as int,
    dataEspelho: json['dataEspelho'] as String,
    nome: json['nome'] as String,
    dataAdicao: json['dataAdicao'] as String,
    naoInformados: json['naoInformados'] as int,
    naoInconsistencia: json['naoInconsistencia'] as int,
    emInconsistencia: json['emInconsistencia'] as int,
    tratados: json['tratados'] as int,
    baixados: json['baixados'] as int,
    statusEstrutura: json['statusEstrutura'] as String,
    idEstrutura: json['idEstrutura'] as int,
    previstos: json['previstos'] as int,
  );
}

Map<String, dynamic> _$EstruturaInventarioToJson(
        EstruturaInventario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'dataEspelho': instance.dataEspelho,
      'dataAdicao': instance.dataAdicao,
      'naoInformados': instance.naoInformados,
      'naoInconsistencia': instance.naoInconsistencia,
      'emInconsistencia': instance.emInconsistencia,
      'tratados': instance.tratados,
      'baixados': instance.baixados,
      'statusEstrutura': instance.statusEstrutura,
      'idEstrutura': instance.idEstrutura,
      'previstos': instance.previstos,
    };
