// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizacao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrganizacaoAdapter extends TypeAdapter<Organizacao> {
  @override
  final int typeId = 14;

  @override
  Organizacao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Organizacao(
      id: fields[0] as int,
      codigo: fields[1] as String,
      nome: fields[2] as String,
      sigla: fields[3] as String,
      codigoENome: fields[4] as String,
      statusUnidade: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Organizacao obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.codigo)
      ..writeByte(2)
      ..write(obj.nome)
      ..writeByte(3)
      ..write(obj.sigla)
      ..writeByte(4)
      ..write(obj.codigoENome)
      ..writeByte(5)
      ..write(obj.statusUnidade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
