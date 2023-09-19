// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 0;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel()
      ..nome = fields[0] as String
      ..imc = fields[1] as double
      ..dia = fields[2] as String
      ..mes = fields[3] as String
      ..ano = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.imc)
      ..writeByte(2)
      ..write(obj.dia)
      ..writeByte(3)
      ..write(obj.mes)
      ..writeByte(4)
      ..write(obj.ano);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
