// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estruturaInventarioNew.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstruturaInventarioNewAdapter
    extends TypeAdapter<EstruturaInventarioNew> {
  @override
  final int typeId = 9;

  @override
  EstruturaInventarioNew read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstruturaInventarioNew(
      id: fields[0] as int,
      dominioStatusInventarioEstrutura: fields[1] as Dominio,
      dadosBensPatrimoniais: (fields[2] as List)?.cast<DadosBensPatrimoniais>(),
      estruturaOrganizacional: fields[3] as Organizacao,
      idInventario: fields[5] as int,
      inventario: fields[4] as Levantamento,
    );
  }

  @override
  void write(BinaryWriter writer, EstruturaInventarioNew obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dominioStatusInventarioEstrutura)
      ..writeByte(2)
      ..write(obj.dadosBensPatrimoniais)
      ..writeByte(3)
      ..write(obj.estruturaOrganizacional)
      ..writeByte(4)
      ..write(obj.inventario)
      ..writeByte(5)
      ..write(obj.idInventario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstruturaInventarioNewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
