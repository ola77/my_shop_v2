import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myshop/models/products/product.dart';
import 'package:myshop/models/products/products.dart';


part 'item.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Item extends Equatable {
  @HiveField(1)
  int id;
  @HiveField(2)
  int quantity;
  @HiveField(3)
  int color;
  @HiveField(4)
  int size;

  @JsonKey(ignore: true)
  @HiveField(0)
  String localId;
  @HiveField(5)
  @JsonKey(ignore: true)
  ProductsModel product;

  Item({
    this.id,
    this.quantity,
    this.color,
    this.size,
    this.localId,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [localId, quantity, size, color];
}
