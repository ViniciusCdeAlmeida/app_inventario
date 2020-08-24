// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bemPatrimonial.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BemPatrimonialAdapter extends TypeAdapter<BemPatrimonial> {
  @override
  final int typeId = 0;

  @override
  BemPatrimonial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BemPatrimonial(
      id: fields[0] as int,
      numeroPatrimonial: fields[1] as String,
      numeroPatrimonialCompleto: fields[2] as String,
      numeroPatrimonialCompletoAntigo: fields[3] as String,
      material: fields[4] as MaterialEst,
      caracteristicas: (fields[5] as List)?.cast<Caracteristicas>(),
    );
  }

  @override
  void write(BinaryWriter writer, BemPatrimonial obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numeroPatrimonial)
      ..writeByte(2)
      ..write(obj.numeroPatrimonialCompleto)
      ..writeByte(3)
      ..write(obj.numeroPatrimonialCompletoAntigo)
      ..writeByte(4)
      ..write(obj.material)
      ..writeByte(5)
      ..write(obj.caracteristicas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BemPatrimonialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BemPatrimonialDemandaAdapter extends TypeAdapter<BemPatrimonialDemanda> {
  @override
  final int typeId = 1;

  @override
  BemPatrimonialDemanda read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BemPatrimonialDemanda(
      id: fields[0] as int,
      numeroPatrimonial: fields[1] as String,
      numeroPatrimonialCompleto: fields[2] as String,
      numeroPatrimonialCompletoAntigo: fields[3] as String,
      materialBem: fields[6] as MaterialEst,
      caracteristicas: (fields[7] as List)?.cast<Caracteristicas>(),
      dominioSituacaoFisica: fields[4] as Dominio,
      dominioStatus: fields[5] as Dominio,
      estruturaOrganizacionalAtual: fields[8] as Organizacao,
    );
  }

  @override
  void write(BinaryWriter writer, BemPatrimonialDemanda obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numeroPatrimonial)
      ..writeByte(2)
      ..write(obj.numeroPatrimonialCompleto)
      ..writeByte(3)
      ..write(obj.numeroPatrimonialCompletoAntigo)
      ..writeByte(4)
      ..write(obj.dominioSituacaoFisica)
      ..writeByte(5)
      ..write(obj.dominioStatus)
      ..writeByte(6)
      ..write(obj.materialBem)
      ..writeByte(7)
      ..write(obj.caracteristicas)
      ..writeByte(8)
      ..write(obj.estruturaOrganizacionalAtual);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BemPatrimonialDemandaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
