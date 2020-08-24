// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materialCaracteristica.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialCaracteristicaAdapter
    extends TypeAdapter<MaterialCaracteristica> {
  @override
  final int typeId = 12;

  @override
  MaterialCaracteristica read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaterialCaracteristica(
      id: fields[0] as int,
      codigo: fields[1] as String,
      descricao: fields[2] as String,
      caracteristica: fields[3] as Caracteristica,
    );
  }

  @override
  void write(BinaryWriter writer, MaterialCaracteristica obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.codigo)
      ..writeByte(2)
      ..write(obj.descricao)
      ..writeByte(3)
      ..write(obj.caracteristica);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialCaracteristicaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
