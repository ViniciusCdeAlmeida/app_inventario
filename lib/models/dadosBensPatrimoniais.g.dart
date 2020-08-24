// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dadosBensPatrimoniais.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosBensPatrimoniaisAdapter extends TypeAdapter<DadosBensPatrimoniais> {
  @override
  final int typeId = 6;

  @override
  DadosBensPatrimoniais read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosBensPatrimoniais(
      id: fields[0] as int,
      dominioSituacaoFisica: fields[2] as Dominio,
      dominioStatus: fields[3] as Dominio,
      dominioStatusInventarioBem: fields[4] as Dominio,
      bemPatrimonial: fields[5] as BemPatrimonial,
      idInventario: fields[6] as int,
      idInventarioEstruturaOrganizacional: fields[7] as int,
      material: fields[8] as MaterialEst,
      inventarioBemPatrimonial: fields[9] as InventarioBemPatrimonial,
      numeroPatrimonial: fields[1] as String,
      inventariado: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DadosBensPatrimoniais obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numeroPatrimonial)
      ..writeByte(2)
      ..write(obj.dominioSituacaoFisica)
      ..writeByte(3)
      ..write(obj.dominioStatus)
      ..writeByte(4)
      ..write(obj.dominioStatusInventarioBem)
      ..writeByte(5)
      ..write(obj.bemPatrimonial)
      ..writeByte(6)
      ..write(obj.idInventario)
      ..writeByte(7)
      ..write(obj.idInventarioEstruturaOrganizacional)
      ..writeByte(8)
      ..write(obj.material)
      ..writeByte(9)
      ..write(obj.inventarioBemPatrimonial)
      ..writeByte(10)
      ..write(obj.inventariado);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosBensPatrimoniaisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
