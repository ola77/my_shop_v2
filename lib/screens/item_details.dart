
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products_list/products_list.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/strings.dart';
import 'package:myshop/res/text_styles.dart';
import 'package:myshop/widgets/m_text.dart';
import 'package:myshop/widgets/msize_boxes.dart';
import 'package:myshop/widgets/mtext_display.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  // final String productId;
  // final int index;

  //ProductDetailsScreen({this.productId, this.index});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final PageController pageController = PageController();
  ProductsListModel product;

  @override
  Widget build(BuildContext context) {

    product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[600]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: MText(

          text: AppStrings.ITEM_DETAILS,
              color:AppColors.mainColor,
              fontSize: 20.sp,
            //loadedProduct.title,
          ),

        ),
        body:buildBody(context)

    );
  }

  Widget buildBody(BuildContext context,) {
    return
      SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImages(),
            buildProductDetails(context, ),
          ],
        ),
      );

  }

  Widget buildImages() {
    return Stack(
      children: [
        buildImagePageView(),
        buildPageIndicator(),
        // MLikeWidget(),
      ],
    );
  }

  Widget buildImagePageView() {
    return
      Container(
        height: 1.sh * 0.65,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:3,
          controller: pageController,
          itemBuilder: (context, index) => Image.network(
            ' ${ product.image[index].length}',
            width: double.infinity,
            height: 400.h,
            fit: BoxFit.fill,

          ),
        ),
      );

  }

  Widget buildPageIndicator() {
    return Positioned(
        right: 16.w,
        bottom: 40.w,
        child: Transform.rotate(
          angle: 3.14 / 2,
          child: SmoothPageIndicator(
          controller: pageController,
            count: 3,
            effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.mainColor,
                dotColor: AppColors.BLACK,
                radius: 10),
          ),
        ));
  }

 Widget buildProductDetails(BuildContext context,  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MTextDisplay(
            text: '${product.title}'?? '' ,
            textAlign: TextAlign.start,
            textStyle: AppTextStyles.regular_16,
          ),
        //  _buildPrice(product.price, product.quantity),
          MHeight(
            height: 10,
          ),
          _buildDetailsText(),
          MHeight(
            height: 20,
          ),
         // _buildSize(product.sizes, product.category),
          MHeight(
            height: 20,
          ),
          //_buildColors(product.colors),

          MHeight(
            height: 20,
          ),


        ],
      ),
    );
  }

 Widget _buildDetailsText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitleText(text: AppStrings.DETAILS),
        buildGrayDetailsText(text:'${product.description}')
      ],
    );
  }

 Widget buildTitleText({String text, String translation}) {
    return MTextDisplay(
     // translation: translation,
      text: text,
      textAlign: TextAlign.start,
      textStyle: AppTextStyles.regular_16,
    );
  }

  Widget buildGrayDetailsText({String text}) {
    return MTextDisplay(
      text: text,
      textStyle: AppTextStyles.medium_14.copyWith(color: AppColors.GRAY),
      textAlign: TextAlign.start,
    );
  }
}
