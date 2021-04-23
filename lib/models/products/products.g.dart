// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) {
  return ProductsModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..price = json['price'] as double
    ..quantity = json['quantity'] as int
    ..frontImage = json['front_image'] as String
    ..backImage = json['back_image'] as String
    ..wished = json['wished'] as bool
    ..category = json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('price', instance.price);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('front_image', instance.frontImage);
  writeNotNull('back_image', instance.backImage);
  writeNotNull('wished', instance.wished);
  writeNotNull('category', instance.category);
  return val;
}
