// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DominioAdapter extends TypeAdapter<Dominio> {
  @override
  final int typeId = 7;

  @override
  Dominio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dominio(
      id: fields[0] as int,
      nome: fields[1] as String,
      descricao: fields[2] as String,
      chave: fields[3] as String,
      codigo: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Dominio obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.descricao)
      ..writeByte(3)
      ..write(obj.chave)
      ..writeByte(4)
      ..write(obj.codigo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DominioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
