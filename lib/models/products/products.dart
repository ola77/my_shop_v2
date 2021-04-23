import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:myshop/models/products/category/category.dart';

import '../color.dart';
import '../imageModel.dart';
import '../size.dart';
part 'products.g.dart';


@JsonSerializable(includeIfNull: false)
class ProductsModel{
  int id;
  String title;
  String description;
  double price;
  int quantity;
  @JsonKey(name: 'front_image')
  String frontImage;
  @JsonKey(name: 'back_image')
  String backImage;
  bool wished;
  List<ImageModel> images;
 CategoryModel category;
  List<SizeModel> sizes;
  List<ColorModel> colors;
  String barcode;
  @JsonKey(name: "related_products")
  List<ProductsModel> relatedProducts;
  @JsonKey(name: "category_products")
  List<ProductsModel> categoryProducts;



  ProductsModel( {this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.frontImage,
    this.backImage,
    this.wished});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);



  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);


  @override
  fromJson(Map<String, dynamic> json) {
    return ProductsModel.fromJson(json);
  }
}
