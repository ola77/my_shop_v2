// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListModel _$ProductsListModelFromJson(Map<String, dynamic> json) {
  return ProductsListModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..quantity = json['quantity'] as int
    ..image = json['image'] as String
    ..category = json['category'] as String;
}

Map<String, dynamic> _$ProductsListModelToJson(ProductsListModel instance) {
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
  writeNotNull('image', instance.image);
  writeNotNull('category', instance.category);
  return val;
}
