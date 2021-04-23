
import 'package:flutter/material.dart';
import 'package:myshop/screens/item_details.dart';
import 'package:myshop/screens/login.dart';
import 'package:myshop/screens/products_list.dart';





    const String  HOME ='/home';
    const String  LOGIN ='/login';
    const String  PRODUCTS ='/';
    const String PROFILES ='/profile';
    const String FAVOURITE ='/Favourite';
    const String  ORDERS ='/Orders';
    const String CART ='/Cart';
   const  String ITEM_DETAILS ='/itemDetails';
   const  String IMAGE_VIEWER = "/imageViewer";


class MRouter {

  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case PRODUCTS:
        return MaterialPageRoute(builder: (_) => ProductHome());
        case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case ITEM_DETAILS:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("no screens for that root"),
            ),
          );
        });
    // static var routes ={
    //   Home :(context)=>HomeScreen(),
    //   Profiles :(context)=>HomeScreen(),
    //   Favourite :(context)=>FavouriteScreen(),
    //   Orders :(context)=>HomeScreen(),
    //   Cart :(context)=>CartScreen(),
    //   Products :(context)=>ProductHome(),


    }
  }

 }








