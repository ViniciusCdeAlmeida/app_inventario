// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bens.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BensAdapter extends TypeAdapter<Bens> {
  @override
  final int typeId = 2;

  @override
  Bens read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bens(
      id: fields[0] as int,
      descricaoDominioSituacaoFisica: fields[1] as String,
      codigoEstrutura: fields[2] as String,
      idEstutura: fields[3] as int,
      descricaoMaterial: fields[4] as String,
      nomeEstrutura: fields[5] as String,
      numeroPatrimonial: fields[6] as String,
      descricaoDominioStatus: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bens obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.descricaoDominioSituacaoFisica)
      ..writeByte(2)
      ..write(obj.codigoEstrutura)
      ..writeByte(3)
      ..write(obj.idEstutura)
      ..writeByte(4)
      ..write(obj.descricaoMaterial)
      ..writeByte(5)
      ..write(obj.nomeEstrutura)
      ..writeByte(6)
      ..write(obj.numeroPatrimonial)
      ..writeByte(7)
      ..write(obj.descricaoDominioStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BensAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
