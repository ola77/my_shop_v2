import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'products_list.g.dart';


@JsonSerializable(includeIfNull: false)
class ProductsListModel{
  int id;
  String title;
  String description;
  double price;
  int quantity;
  String image;
  String category;



  ProductsListModel();

  factory ProductsListModel.fromJson(Map<String, dynamic> json) => _$ProductsListModelFromJson(json);



  Map<String, dynamic> toJson() => _$ProductsListModelToJson(this);
}
