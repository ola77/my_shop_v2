import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'size.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class SizeModel {
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;

  SizeModel(this.id, this.title);
  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
}
