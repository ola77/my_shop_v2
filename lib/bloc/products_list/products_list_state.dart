import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/models/products_list/products_list.dart';


abstract class ProductsListState extends Equatable {
  ProductsListState();

  List get props => [];
}

class ProductsListInitial extends ProductsListState {
  // @override
  // String toString() => 'ProductsInitial';
}

class ProductsListLoading extends ProductsListState {}

class ProductsListSuccess extends ProductsListState {
  final List<ProductsListModel> data ;

  ProductsListSuccess({@required this.data});

  List<Object> get props => [data];

}


class ProductsListFailure extends ProductsListState {
  final String error;

  ProductsListFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'ProductsFailure { error: $error }';
}
