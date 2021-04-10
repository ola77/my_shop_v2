import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';


@JsonSerializable(includeIfNull: false)
class CategoryModel{
  int id;
  String title;
  String guide;



  CategoryModel();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);



  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
