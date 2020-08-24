// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventarioBemPatrimonial.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventarioBemPatrimonialAdapter
    extends TypeAdapter<InventarioBemPatrimonial> {
  @override
  final int typeId = 10;

  @override
  InventarioBemPatrimonial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventarioBemPatrimonial(
      id: fields[0] as int,
      numeroPatrimonial: fields[3] as String,
      numeroPatrimonialAntigo: fields[4] as String,
      numeroPatrimonialNovo: fields[5] as String,
      dominioSituacaoFisica: fields[7] as Dominio,
      dominioStatus: fields[8] as Dominio,
      caracteristicas: (fields[6] as List)?.cast<Caracteristicas>(),
      bemNaoEncontrado: fields[9] as bool,
      bemNaoInventariado: fields[10] as bool,
      dominioStatusInventarioBem: fields[11] as Dominio,
      idDadosBemPatrimonialMobile: fields[1] as int,
      idInventarioEstruturaOrganizacionalMobile: fields[2] as int,
      material: fields[12] as MaterialEst,
      nomeUsuarioColeta: fields[13] as String,
      novoBemInvetariado: fields[14] as bool,
      tipoMobile: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InventarioBemPatrimonial obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idDadosBemPatrimonialMobile)
      ..writeByte(2)
      ..write(obj.idInventarioEstruturaOrganizacionalMobile)
      ..writeByte(3)
      ..write(obj.numeroPatrimonial)
      ..writeByte(4)
      ..write(obj.numeroPatrimonialAntigo)
      ..writeByte(5)
      ..write(obj.numeroPatrimonialNovo)
      ..writeByte(6)
      ..write(obj.caracteristicas)
      ..writeByte(7)
      ..write(obj.dominioSituacaoFisica)
      ..writeByte(8)
      ..write(obj.dominioStatus)
      ..writeByte(9)
      ..write(obj.bemNaoEncontrado)
      ..writeByte(10)
      ..write(obj.bemNaoInventariado)
      ..writeByte(11)
      ..write(obj.dominioStatusInventarioBem)
      ..writeByte(12)
      ..write(obj.material)
      ..writeByte(13)
      ..write(obj.nomeUsuarioColeta)
      ..writeByte(14)
      ..write(obj.novoBemInvetariado)
      ..writeByte(15)
      ..write(obj.tipoMobile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventarioBemPatrimonialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
