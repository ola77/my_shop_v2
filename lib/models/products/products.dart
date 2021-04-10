import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:myshop/models/products/category/category.dart';
part 'products.g.dart';


@JsonSerializable(includeIfNull: false)
class ProductsModel{
  int id;
  String title;
  String description;
  int price;
  int quantity;
  @JsonKey(name: 'front_image')
  String frontImage;
  @JsonKey(name: 'back_image')
  String backImage;
  bool wished;
 CategoryModel category;



  ProductsModel();

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);



  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
