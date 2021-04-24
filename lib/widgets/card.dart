import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/models/products/product.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/utilities/routes.dart';

import 'm_container.dart';
import 'm_text.dart';

class CardWidget extends StatelessWidget {
  bool isClicked = true;
  String id;
  String image;
  String title;
  String price;
  Size size;
  CardWidget({
    this.isClicked,
    this.id,
    this.image,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, ITEM_DETAILS, arguments: product),
      child: Card(
        child: Stack(
          children: [
            Material(
              type: MaterialType.card,
              borderRadius: BorderRadius.circular(15),
              elevation: 3,
              shadowColor: Colors.blueGrey,
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: id,
                      child: Image.network(
                        image ?? '',
                        //height: 100,
                        fit: BoxFit.fill,
                      ),
                     // transitionOnUserGestures: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                    child: MText(
                      text: title,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
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
                left: 110.w,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite,
                    color: isClicked ? AppColors.mRed : AppColors.mDarkGray,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
