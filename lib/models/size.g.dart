// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SizeModelAdapter extends TypeAdapter<SizeModel> {
  @override
  final int typeId = 5;

  @override
  SizeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SizeModel(
      fields[1] as int,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SizeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) {
  return SizeModel(
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
