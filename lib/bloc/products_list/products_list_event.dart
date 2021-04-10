import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/models/products_list/products_list.dart';


abstract class ProductsListEvent extends Equatable {
  ProductsListEvent();

  List<Object> get props => [];
}

class FetchProductsList extends ProductsListEvent {

 final ProductsListModel data;

 FetchProductsList({this.data});

  @override
  String toString() => ' ProductsButtonPressed   ';
}
