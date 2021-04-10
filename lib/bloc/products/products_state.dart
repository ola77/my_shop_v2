import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';


abstract class ProductsState extends Equatable {
  ProductsState();

  List get props => [];
}

class ProductsInitial extends ProductsState {
  // @override
  // String toString() => 'ProductsInitial';
}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductsModel> data ;

  ProductsSuccess({@required this.data});

  List<Object> get props => [data];

}


class ProductsFailure extends ProductsState {
  final String error;

  ProductsFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'ProductsFailure { error: $error }';
}
