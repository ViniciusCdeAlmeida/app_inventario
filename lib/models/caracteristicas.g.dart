// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristicas.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CaracteristicasAdapter extends TypeAdapter<Caracteristicas> {
  @override
  final int typeId = 4;

  @override
  Caracteristicas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Caracteristicas(
      id: fields[0] as int,
      valorMaterialCaracteristica: fields[1] as String,
      materialCaracteristica: fields[2] as MaterialCaracteristica,
      dominiosCaracteristicas: fields[3] as Dominio,
    );
  }

  @override
  void write(BinaryWriter writer, Caracteristicas obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.valorMaterialCaracteristica)
      ..writeByte(2)
      ..write(obj.materialCaracteristica)
      ..writeByte(3)
      ..write(obj.dominiosCaracteristicas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaracteristicasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
