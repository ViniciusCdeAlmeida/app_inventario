// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristica.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CaracteristicaAdapter extends TypeAdapter<Caracteristica> {
  @override
  final int typeId = 3;

  @override
  Caracteristica read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Caracteristica(
      id: fields[0] as int,
      codigo: fields[1] as String,
      descricao: fields[2] as String,
      dominioTipoDado: fields[4] as Dominio,
      chaveDominio: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Caracteristica obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.codigo)
      ..writeByte(2)
      ..write(obj.descricao)
      ..writeByte(3)
      ..write(obj.chaveDominio)
      ..writeByte(4)
      ..write(obj.dominioTipoDado);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaracteristicaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
