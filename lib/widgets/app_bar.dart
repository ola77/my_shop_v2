import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:myshop/res/strings.dart';
import 'package:myshop/widgets/m_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes.dart';

AppBar appBar(
    {bool searchVisibility,
    bool drawerVisibility,
    bool profilePicVisibility,
    String title,
    Color textColor,
    String translation,
    String text,
      BuildContext context,
    Function onTap,
    PreferredSizeWidget bottom}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      children: [
        InkWell(
        //  onTap: () => Navigator.of(context).pushNamed(AppRoute.Menu) ,

          child: Visibility(
            visible: drawerVisibility == true,
            child: SvgPicture.asset(
            AppPics.Drawer,
              color: AppColors.secondColor,
              width: 24.w,
              height: 8.h,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: MText(
              // translation: translation,
              text: text,
              color: textColor,
              textAlign: TextAlign.start,
              //   textStyle: AppTextStyle.TITLE_REGULAR,
            ),
          ),
        ),
        Visibility(
          visible: searchVisibility == true,
          child: Icon(Icons.search,
          color: AppColors.secondColor,),
        ),
        SizedBox(
          width: 17.w,
        ),
        InkWell(
         // onTap: () => Navigator.of(context).pushNamed(AppRoute.MyProfile) ,
          child: Visibility(
            visible: profilePicVisibility == true,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                    child: Image.asset(
                 AppPics.Profile,
                  width: 27.w,
                  height: 27.h,
                ))),
          ),
        ),
      ],
    ),
    iconTheme: IconThemeData(color: Colors.white),
    automaticallyImplyLeading: true,
    bottom: bottom ?? null,
  );
}


AppBar mainScreenAppBar(
    {String titleTranslation,
      BuildContext context,
      bool profilePicVisibility,
      bool postVisibility,
      bool expandleVisibility,

      String titleText,
      String onlineText,
      bool searchVisibility,
      PreferredSizeWidget bottom}) {
  return AppBar(
    backgroundColor: AppColors.secondColor,
    centerTitle: true,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
         // onTap: () => Navigator.of(context).pushNamed(AppRoute.MyProfile) ,
          child: Visibility(
            visible: profilePicVisibility == true,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 27.w,
                      height: 27.h,
                    ))),
          ),
        ),
        SizedBox(width: 16.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleTranslation == null && titleText == null
                ? SizedBox()
                : MText(
              fontSize: ScreenUtil().setSp(12),
              translation: titleTranslation,
              text: titleText,
              textAlign: TextAlign.start,
            ),
            titleTranslation == null && titleText == null
                ? SizedBox()
                : Row(
                  children: [

                    MText(
              fontSize: ScreenUtil().setSp(12),

              translation: titleTranslation,
              text: onlineText,
              textAlign: TextAlign.start,
            ),
                    Visibility(
                        visible: expandleVisibility == true,
                        child: Icon(Icons.keyboard_arrow_down)
                    ),
                  ],
                ),
          ],
        ),
        SizedBox(width: 100.w,),

        Visibility(
          visible: postVisibility == true,
          child: MText(
            text: AppStrings.Profile,
            color: Colors.white,
          )
        ),

      ],
    ),

    iconTheme: IconThemeData(color: Colors.white),
    automaticallyImplyLeading: true,
    bottom: bottom ?? null,
  );
}

AppBar aboutAppBar(
    {
      String titleTranslation,
      BuildContext context,
      String titleText,
      String aboutText,
      PreferredSizeWidget bottom}) {
  return AppBar(
    toolbarHeight: 70.h,
    backgroundColor:Colors.white,
    centerTitle: true,
    elevation: 0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleTranslation == null && titleText == null
            ? SizedBox()
            : MText(
          fontSize: ScreenUtil().setSp(28),
          translation: titleTranslation,
          text: titleText,

          color: AppColors.secondColor,
          textAlign: TextAlign.start,
        ),
        titleTranslation == null && titleText == null
            ? SizedBox()
            : MText(
              fontSize: ScreenUtil().setSp(12),
              translation: titleTranslation,
              text: aboutText,
              color: Colors.black,
              textAlign: TextAlign.start,
            ),
      ],
    ),

    iconTheme: IconThemeData(color: Colors.white),
    automaticallyImplyLeading: true,
    bottom: bottom ?? null,
  );
}