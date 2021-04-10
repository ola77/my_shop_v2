import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'm_container.dart';
import 'm_text.dart';
class CardWidget extends StatelessWidget {
  bool isClicked=true;
int id;
String image;

  CardWidget(
      {this.isClicked, this.id, this.image, this.title, this.price, this.size});

  String title;
String price;

  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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

                        tag: id,
                        child: Image.asset(image?? '',
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
                      text: title,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.h),
                        child: MText(
                          color: AppColors.secondColor,
                          text: price,
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
                  onTap: (){},
                  child: Icon(Icons.favorite,
                    color: isClicked?AppColors.mRed:AppColors.mDarkGray,),
                ))
          ],
        ),
      ),
    );
  }
}
