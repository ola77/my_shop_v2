import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/repository/products_repo.dart';
import 'package:myshop/utilities/internetConnectivity.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial());

  ProductsResponse data;

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is FetchProducts) {
      yield* Products(event);
    }
  }
  Stream<ProductsState> Products(FetchProducts event) async* {

   yield ProductsLoading();
    if (await isInternetConnected()) {
      ProductsResponse result  = await ProductsRepository.getProducts();
      print(result.data.toString());
      if ( result!= null) {
       print('success');
        yield ProductsSuccess(data:result.data);

      } else
        yield ProductsFailure(error: result.toString());
    }
    else
       yield ProductsFailure(error: internetErrorMessage());
      }
    }

