import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'color.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class ColorModel {
  @HiveField(1)
  int id;
  @HiveField(2)
  String code;
  @HiveField(3)
  String title;

  ColorModel({this.id, this.code, this.title});

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ColorModelToJson(this);
}
