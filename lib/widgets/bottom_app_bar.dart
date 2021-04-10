import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAppBarWidget extends StatelessWidget {


  PageController _myPage = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      BottomAppBar(
        elevation: 2,
        shape: CircularNotchedRectangle(),
        child:
        Container(
          height: 55.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: SvgPicture.asset(
                  AppPics.Selected_home,
                  color: _currentIndex == 0
                      ? AppColors.secondColor
                      : AppColors.mDarkGray,
                ),
               // onPressed: () => jumpToPage(0),
              ),
              IconButton(
                disabledColor: AppColors.mDarkGray,
                color: AppColors.secondColor,
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: SvgPicture.asset(
                  AppPics.Add_user,
                  color: _currentIndex == 1
                      ? AppColors.secondColor
                      : AppColors.mDarkGray,
                ),
            //    onPressed: () => jumpToPage(1),
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: SvgPicture.asset(
                  AppPics.Sms,
                  color: _currentIndex == 2
                      ? AppColors.secondColor
                      : AppColors.mDarkGray,
                ),
              //  onPressed: () => jumpToPage(2),
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: SvgPicture.asset(
                  AppPics.Flash,
                  color: _currentIndex == 3
                      ? AppColors.secondColor
                      : AppColors.mDarkGray,
                ),
               // onPressed: () => jumpToPage(3),
              ),
            ],
          ),

        ),
      );
  }

// jumpToPage(int i) {
//   setState(() {
//     _myPage.animateToPage(i,
//         duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//   });
// }

}