// import 'dart:convert';
//
// import 'package:hive/hive.dart';
// import 'package:onsi/models/item.dart';
// import 'package:onsi/models/user.dart';
//
// class AppShared {
//   static String lang = 'en';
//   static String token;
//   final String userBox = 'userBox';
//   final String userKey = 'user';
//   static const String itemsBox = "items";
//
//   Future<void> saveToken(User user) async {
//     token = user.token;
//     Box box = Hive.box<User>(userBox);
//     box.put(userKey, user);
//   }
//
//   Future<User> getUser() async {
//     Box box = Hive.box<User>(userBox);
//     User user = box.get(userKey);
//     print("rr");
//     if (user != null) {
//       token = user.token;
//       return user;
//     } else {
//       return null;
//     }
//   }
//
//   Future<void> deleteToken(User user) async {
//     token = null;
//     Box box = Hive.box<User>(userBox);
//     box.delete(userKey);
//   }
//
//   // static Future loadCarts() async {
//   //   var dir = await getApplicationDocumentsDirectory();
//   //   await Hive.init(dir.path);
//   //   return await Hive.openBox(MyCart);
//   // }
//
//   // static List<CartModel> getCarts() {
//   //   var box = Hive.box(MyCart);
//   //   String cartString = box.get(MyCart, defaultValue: null);
//   //   if (cartString != null) {
//   //     List list = json.decode(cartString) as List;
//   //     return list.map((data) => CartModel.fromJson(data)).toList();
//   //   }
//   //   return [];
//   // }
//
//   // static void saveCarts(List<CartModel> carts) {
//   //   var box = Hive.box(MyCart);
//   //   try {
//   //     String cartString = jsonEncode(carts.map((e) => e.toJson()).toList());
//   //     box.put(MyCart, cartString);
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }
//
//   // static void emptyCart() {
//   //   var box = Hive.box(MyCart);
//   //   box.delete(MyCart);
//   // }
//
// }
//
// //manage langaune
// // final String englishCode = 'en';
// //final String arabicCode = 'ar';
// // String language() {
// //   return lang == englishCode ? englishCode : arabicCode;
// // }
//
// // onboarding management
//
// // final String firstTimeBox = "firstTimeBox";
// // final String firstTime = "firstTime";
//
// // setFirstTime() async {
// //   var box = await Hive.openBox(firstTimeBox);
// //   box.put(firstTime, true);
// // }
// //
// // Future<bool> checkFirstTime() async {
// //   Box box = await Hive.openBox(firstTimeBox);
// //   return box.get(firstTime) as bool == true ? true : false;
// // }
