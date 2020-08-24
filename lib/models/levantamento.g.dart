// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levantamento.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevantamentoAdapter extends TypeAdapter<Levantamento> {
  @override
  final int typeId = 11;

  @override
  Levantamento read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Levantamento(
      id: fields[0] as int,
      dominioTipoInventario: fields[1] as Dominio,
      dominioStatusInventario: fields[2] as Dominio,
      codigoENome: fields[3] as String,
      codigo: fields[5] as String,
      nome: fields[4] as String,
      quantidadeEstruturas: fields[6] as int,
      quantidadeTotalBens: fields[7] as int,
      quantidadeTotalBensTratados: fields[8] as int,
      quantidadeTotalBensSemInconsistencia: fields[10] as int,
      quantidadeTotalBensEmInconsistencia: fields[9] as int,
      quantidadeTotalBensBaixados: fields[11] as int,
      idOrganizacao: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Levantamento obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dominioTipoInventario)
      ..writeByte(2)
      ..write(obj.dominioStatusInventario)
      ..writeByte(3)
      ..write(obj.codigoENome)
      ..writeByte(4)
      ..write(obj.nome)
      ..writeByte(5)
      ..write(obj.codigo)
      ..writeByte(6)
      ..write(obj.quantidadeEstruturas)
      ..writeByte(7)
      ..write(obj.quantidadeTotalBens)
      ..writeByte(8)
      ..write(obj.quantidadeTotalBensTratados)
      ..writeByte(9)
      ..write(obj.quantidadeTotalBensEmInconsistencia)
      ..writeByte(10)
      ..write(obj.quantidadeTotalBensSemInconsistencia)
      ..writeByte(11)
      ..write(obj.quantidadeTotalBensBaixados)
      ..writeByte(12)
      ..write(obj.idOrganizacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevantamentoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
