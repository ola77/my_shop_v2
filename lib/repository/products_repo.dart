import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';




class ProductsRepository {


  static Future<ProductsResponse> getProducts() async {
    //print(products.toJson());
    var response = await http.get('https://onsistore.com/api/product',
        headers: {
          "Content-Type": "application/json",

        });

    print(utf8.decode(response.bodyBytes));

    return ProductsResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
