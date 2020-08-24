// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estruturaInventario.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstruturaInventarioAdapter extends TypeAdapter<EstruturaInventario> {
  @override
  final int typeId = 8;

  @override
  EstruturaInventario read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstruturaInventario(
      id: fields[0] as int,
      dataEspelho: fields[2] as String,
      nome: fields[1] as String,
      dataAdicao: fields[3] as String,
      naoInformados: fields[4] as int,
      naoInconsistencia: fields[5] as int,
      emInconsistencia: fields[6] as int,
      tratados: fields[7] as int,
      baixados: fields[8] as int,
      statusEstrutura: fields[9] as String,
      idEstrutura: fields[10] as int,
      previstos: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EstruturaInventario obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.dataEspelho)
      ..writeByte(3)
      ..write(obj.dataAdicao)
      ..writeByte(4)
      ..write(obj.naoInformados)
      ..writeByte(5)
      ..write(obj.naoInconsistencia)
      ..writeByte(6)
      ..write(obj.emInconsistencia)
      ..writeByte(7)
      ..write(obj.tratados)
      ..writeByte(8)
      ..write(obj.baixados)
      ..writeByte(9)
      ..write(obj.statusEstrutura)
      ..writeByte(10)
      ..write(obj.idEstrutura)
      ..writeByte(11)
      ..write(obj.previstos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstruturaInventarioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
