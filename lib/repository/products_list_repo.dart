import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/models/products_list/products_list.dart';




class ProductsListRepository {


  static Future<List<ProductsListModel>> getProducts() async {
    //print(products.toJson());

    var response = await http.get('https://fakestoreapi.com/products',
        headers: {
          "Content-Type": "application/json",

        });


    print(utf8.decode(response.bodyBytes));
    var products = List<ProductsListModel>();
    if (200 == response.statusCode) {
      var productsJson = json.decode(response.body);

      for(var productsJson in productsJson){
        products.add(ProductsListModel.fromJson(productsJson));
      }
    }
    return products;
  }


        // ProductsModel.fromJson(
        //
        //   JsonDecoder().convert(utf8.decode(response.bodyBytes),
        //
        //
        //   ));


}
