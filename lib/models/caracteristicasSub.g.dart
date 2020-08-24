// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristicasSub.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CaracteristicasSubAdapter extends TypeAdapter<CaracteristicasSub> {
  @override
  final int typeId = 5;

  @override
  CaracteristicasSub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CaracteristicasSub(
      id: fields[0] as int,
      valorMaterialCaracteristica: fields[1] as String,
      materialCaracteristica: fields[2] as MaterialCaracteristica,
    );
  }

  @override
  void write(BinaryWriter writer, CaracteristicasSub obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.valorMaterialCaracteristica)
      ..writeByte(2)
      ..write(obj.materialCaracteristica);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaracteristicasSubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
