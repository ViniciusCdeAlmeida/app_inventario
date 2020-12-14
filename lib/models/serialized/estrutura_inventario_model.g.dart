// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estrutura_inventario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstruturaInventario _$EstruturaInventarioFromJson(Map<String, dynamic> json) {
  return EstruturaInventario(
    id: json['id'] as int,
    estruturaOrganizacional: json['estruturaOrganizacional'] == null
        ? null
        : Organizacao.fromJson(
            json['estruturaOrganizacional'] as Map<String, dynamic>),
    dominioStatusInventarioEstrutura:
        json['dominioStatusInventarioEstrutura'] == null
            ? null
            : Dominio.fromJson(json['dominioStatusInventarioEstrutura']
                as Map<String, dynamic>),
    idInventario: json['idInventario'] as int,
  );
}

Map<String, dynamic> _$EstruturaInventarioToJson(
        EstruturaInventario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estruturaOrganizacional': instance.estruturaOrganizacional,
      'dominioStatusInventarioEstrutura':
          instance.dominioStatusInventarioEstrutura,
      'idInventario': instance.idInventario,
    };
