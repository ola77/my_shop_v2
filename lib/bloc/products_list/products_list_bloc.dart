import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/models/products_list/products_list.dart';
import 'package:myshop/repository/products_list_repo.dart';
import 'package:myshop/repository/products_repo.dart';
import 'package:myshop/utilities/internetConnectivity.dart';
import 'products_list_event.dart';
import 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc() : super(ProductsListInitial());

 List <ProductsListModel> data;

  @override
  Stream<ProductsListState> mapEventToState(ProductsListEvent event) async* {
    if (event is FetchProductsList) {
      yield* ProductsList(event);
    }
  }
  Stream<ProductsListState> ProductsList(FetchProductsList event) async* {

   yield ProductsListLoading();
    if (await isInternetConnected()) {
 List <ProductsListModel> result  = await ProductsListRepository.getProducts();
      print(result.toString());
      if ( result!= null) {
       print('success');
        yield ProductsListSuccess(data:data);

      } else
        yield ProductsListFailure(error: result.toString());
    }
    else
       yield ProductsListFailure(error: internetErrorMessage());
      }
    }

