

import 'package:myshop/res/images.dart';

class Product {
  final String image, title, description;
  final int price, id;


  Product(this.image,
    this.title,
    this.description,
    this.price,

    this.id,
   );
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["title"],
      json["description"],
      json["price"],
      json["id"],
      json["image"],
    );
  }
  static List<Product> parseList(List<dynamic> list) {
    return list.map((i) => Product.fromJson(i)).toList();
  }
}
  List<Product> product = [
    Product(
      AppPics.product1,
      ProductName.product1,
      ProductDescription.description1,
      234,
      1,
    ),
    Product(
      AppPics.product2,
      ProductName.product2,
      ProductDescription.description2,
      234,
      2,
    ),
    Product(
        AppPics.product3,
        ProductName.product3,
        ProductDescription.description3,
        234,
        3,
    ),
    Product(
      AppPics.product4,
        ProductName.product4,
        ProductDescription.description4,
        234,
       4,
    ),
    Product(
      AppPics.product5,
        ProductName.product5,
        ProductDescription.description5,
        234,
       5,
    ),
    Product(
      AppPics.product6,
        ProductName.product6,
        ProductDescription.description6,
        234,
       6,
    ),
    Product(
      AppPics.product1,
        ProductName.product1,
        ProductDescription.description6,
        234,
       7,
    ),
    Product(
      AppPics.product2,
        ProductName.product2,
        ProductDescription.description6,
        234,
       8,
    ),
    Product(
      AppPics.product3,
        ProductName.product3,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product4,
        ProductName.product5,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product4,
        ProductName.product4,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product5,
        ProductName.product5,
        ProductDescription.description5,
        234,
       9,
    ),
    Product(
      AppPics.product1,
        ProductName.product1,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product2,
        ProductName.product2,
        ProductDescription.description2,
        234,
       9,
    ),
    Product(
      AppPics.product3,
        ProductName.product3,
        ProductDescription.description3,
        234,
       9,
    ),
    Product(
      AppPics.product4,
        ProductName.product4,
        ProductDescription.description4,
        234,
       9,
    ),
    Product(
      AppPics.product5,
        ProductName.product5,
        ProductDescription.description5,
        234,
       9,
    ),
    Product(
      AppPics.product6,
        ProductName.product6,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product1,
        ProductName.product1,
        ProductDescription.description1,
        234,
       9,
    ),
    Product(
      AppPics.product2,
        ProductName.product5,
        ProductDescription.description6,
        234,
       9,
    ),
    Product(
      AppPics.product3,
        ProductName.product5,
        ProductDescription.description6,
        234,
       9,
    ),

  ];

class ProductDescription{
 static const  String description1="For a refreshed start to the day!";
 static const String description2="Brand: Kamena, Type: Shower Gel, Scent: Rose, Size: 2 Liter";
 static const String description3="A refreshing shower is a great way to start your day off right, and this hydrating body wash can help you to nourish your skin at the same time.";
 static const  String description4="Radox Perky Peach Shower Gel will delight you with a peach and berry scent and help you feel uplifted.";
 static const  String description5="RADOX Mineral Therapy Feel Ready Shower Gel provides a refreshing shower experience that revives your senses,Our energising shower gel for women is ..";
 static const  String description6="Avène Body Gentle Shower Gel is a delicate shower gel for all skin types..";
}
class ProductName{
 static const  String product1="benecos Natural Melissa Shower Gel";
 static const String product2="Kamena Shower Gel Rose Scent, 2 Liter";
 static const String product3="Dove Shower Gel Fresh touch";
 static const  String product4="Nivea Care Shower Gel, Lemon and Oil, 250ml";
 static const  String product5="Dove Shower Gel Women";
 static const  String product6="Cactus Blossom Shower Gel";
}
