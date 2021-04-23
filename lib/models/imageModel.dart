import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'imageModel.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class ImageModel {
  @HiveField(1)
  int id;
  @HiveField(2)
  String url;

  ImageModel(this.id, this.url);
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
