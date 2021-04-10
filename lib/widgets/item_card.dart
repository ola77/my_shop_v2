import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/models/products/product.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:myshop/widgets/m_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/widgets/m_container.dart';


class Item_card extends StatefulWidget {

  ProductsModel productsModel;

  Item_card(this.productsModel);

  @override
  _Item_cardState createState() => _Item_cardState();
}

class _Item_cardState extends State<Item_card> {
  bool isClicked=true;
   ProductsModel productsModel;
  ProductsResponse productsResponse;
void Clicked(){
  setState(() {
    isClicked=!isClicked;
  });

}
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    productsModel=ModalRoute.of(context).settings.arguments;
    productsResponse=ModalRoute.of(context).settings.arguments;
    return InkWell(
      // onTap: (){
      //   Navigator.pushNamed(
      //       context,
      //       DETAILS,arguments:productModel );
      // },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Stack(
          children: [
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              shadowColor: Colors.blueGrey,
              child: Column(
                children: [
                  Expanded(
                    child: MContainer(
                      borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                      child: Hero(

                        tag: "${productsModel.id}",
                        child: Image.asset(productsModel.frontImage ?? '',
                          ),
                      ),
                      height: size.height,
                      width: size.width,
                      //child: text,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                    child: MText(
                      text: productsModel.title,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.h),
                        child: MText(
                          color: AppColors.secondColor,
                          text: "\$${productsModel.price}",
                        ),
                      ),
                      IconButton(
                          icon: SvgPicture.asset(
                            AppPics.Cart,

                          ),
                          onPressed: null),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10.h,
              left:110.w,
                child: InkWell(
                  onTap: (){
                    Clicked();
                  },
                  child: Icon(Icons.favorite,
                  color: isClicked?AppColors.mRed:AppColors.mDarkGray,),
                ))
          ],
        ),
      ),
    );
  }
}
