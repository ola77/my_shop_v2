import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';


abstract class ProductsEvent extends Equatable {
  ProductsEvent();

  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {

 final ProductsModel data;

  FetchProducts({this.data});

  @override
  String toString() => ' ProductsButtonPressed   ';
}
