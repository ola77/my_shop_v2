





import 'package:myshop/screens/cart.dart';
import 'package:myshop/screens/favourite.dart';
import 'package:myshop/screens/home.dart';
import 'package:myshop/screens/product_details.dart';
import 'package:myshop/screens/products_list.dart';

class AppRoute{
   static const  Home ='/';
   static const  Products ='Products';
   static const Profiles ='profile';
   static const Favourite ='Favourite';
   static const Orders ='Orders';
   static const Cart ='Cart';
   static const ItemDetails ='Item Details';

   static var routes ={
     Home :(context)=>HomeScreen(),
     Profiles :(context)=>HomeScreen(),
     Favourite :(context)=>FavouriteScreen(),
     Orders :(context)=>HomeScreen(),
     Cart :(context)=>CartScreen(),
    ItemDetails :(context)=>ItemDetailsScreen(),
     Products :(context)=>ProductHome(),






   };

 }








