import 'package:json_annotation/json_annotation.dart';
import 'package:myshop/models/products/products.dart';


part 'products_response.g.dart';


@JsonSerializable()
class ProductsResponse {
  bool status;
  String message;
  String errors;
List <ProductsModel> data;

  ProductsResponse();


  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
