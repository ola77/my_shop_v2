// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorModelAdapter extends TypeAdapter<ColorModel> {
  @override
  final int typeId = 6;

  @override
  ColorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorModel(
      id: fields[1] as int,
      code: fields[2] as String,
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ColorModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) {
  return ColorModel(
    id: json['id'] as int,
    code: json['code'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
    };
