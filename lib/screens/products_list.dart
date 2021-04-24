
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/bloc/products_list/products_list_bloc.dart';
import 'package:myshop/bloc/products_list/products_list_event.dart';
import 'package:myshop/bloc/products_list/products_list_state.dart';
import 'package:myshop/models/products_list/products_list.dart';
import 'package:myshop/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/res/image_paths.dart';
import 'package:myshop/res/images.dart';
import 'package:myshop/res/strings.dart';
import 'package:myshop/res/text_styles.dart';
import 'package:myshop/utilities/routes.dart';
import 'package:myshop/widgets/app_bar.dart';
import 'package:myshop/widgets/card.dart';
import 'package:myshop/widgets/loading.dart';
import 'package:myshop/widgets/m_text.dart';
import 'package:myshop/widgets/mround_corner_network_image.dart';
import 'package:myshop/widgets/msize_boxes.dart';
import 'package:myshop/widgets/mtext_display.dart';
import 'favourite.dart';

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {


  Size size;

  PageController _myPage = PageController(initialPage: 0);

  int _currentIndex = 0;
  bool isExpanded;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  bool isClicked = true;

  void Clicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: AppColors.mWhite,
      body: buildPageView(),
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton:
      _currentIndex == 0 ? buildFloatingActionButton() : null,
      floatingActionButtonLocation:
      _currentIndex == 0 ? FloatingActionButtonLocation.endDocked : null,
    );
  }



  Widget buildAppBar(BuildContext context) {
    return appBar(
      textColor: AppColors.secondColor,
      text: _getproperTitle(),
      context: context,
      searchVisibility: _currentIndex != 2,
      drawerVisibility: _currentIndex == 0,
    );
  }
  Widget buildPageView() {
    return PageView(
      controller: _myPage,
      onPageChanged: (int) {
        print('Page Changes to index $int');
        onTabTapped(int);
      },
      children: [
        buildList(),
        FavouriteScreen(),
        Container(),
        Container(),
      ],
    );
  }
  Widget buildList() {
    return BlocProvider<ProductsListBloc>(
      create: (_) => ProductsListBloc()..add(FetchProductsList()),
      child: BlocConsumer<ProductsListBloc, ProductsListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductsListLoading) {
              return Loading();
            }
            if (state is ProductsListSuccess) {
              print("done");
              return buildProductsList(state.data);

            } else {
              return Center(
                  child: Text(
                    "error",
                    style: TextStyle(fontSize: 24),
                  ));
            }
          }),
    );
  }
  Widget buildHomeBody(List<ProductsListModel>productsList) {
    return Container(
      child:

      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: MText(
                    text: AppStrings.OurProducts,
                  ),
                ),
              ),
              //buildSort(),
            ],
          ),
          buildProductsList(productsList),
        ],
      ),
    );
  }
  Widget buildProductsList(List<ProductsListModel>productsList,) {
    return Container(
      height: size.height,
      width: size.width,
      child:
      StaggeredGridView.countBuilder(
      crossAxisCount: 2,
        itemCount: productsList?.length ?? 0,
        padding: EdgeInsets.symmetric(
        horizontal: 8.w,
    ),
    itemBuilder: (BuildContext context, int index) =>
    _buildItem(context, productsList[index]),
    staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
    mainAxisSpacing: 4.w,
    crossAxisSpacing: 4.w,
      ),
    );


  }

  _onProductTap(BuildContext context, ProductsListModel product) {
    print(product.title);
    Navigator.pushNamed(context, ITEM_DETAILS, arguments: product);
  }

  Widget _buildItem(BuildContext context, ProductsListModel product) {
    return
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () => _onProductTap(context, product),
                  child: MRoundCornerNetworkImage(
                    imagePath: product.image,
                  ),
                ),
                Positioned(
                  right: 16.w,
                  top: 16.w,
                  child: Visibility(
                   // visible: checkAuthentication(
                        //context: context, showDialog: false),
                    child: InkWell(
                      // onTap: () => BlocProvider.of<WishListBloc>(context)
                      //     .add(WishLike(product: product)),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child:
                        SvgPicture.asset(
                          AppPics.LIKE,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => _onProductTap(context, product),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MTextDisplay(
                      text: product.title ?? " ",
                      textAlign: TextAlign.start,
                      textStyle: AppTextStyles.regular_16,
                    ),
                    MHeight(
                      height: 8,
                    ),
                    Row(
                      children: [
                        MTextDisplay(
                          text: product.price.toString() ?? " ",
                          textStyle: AppTextStyles.regular_16
                              .copyWith(color: Colors.grey),
                        ),
                        MWidth(
                          width: 10,
                        ),
                        MTextDisplay(
                          text: "EGP",
                          textStyle: AppTextStyles.regular_14
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );


  }


  Widget buildFloatingActionButton() {
    return FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          AppPics.Cart,
        ),
        backgroundColor: AppColors.secondColor);
  }
  Widget buildBottomAppBar() {
    return BottomAppBar(
      elevation: 2,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 55.h,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: SvgPicture.asset(
                AppPics.Selected_home,
                color: _currentIndex == 0
                    ? AppColors.secondColor
                    : AppColors.mDarkGray,
              ),
              onPressed: () => jumpToPage(0),
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
              onPressed: () => jumpToPage(1),
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
              onPressed: () => jumpToPage(2),
            ),
            Visibility(
              visible: _currentIndex == 0 ? true : false,
              child: Container(),
              // IconButton(
              //     iconSize: 30.0,
              //     padding: EdgeInsets.only(right: 28.0),
              //     icon:
              //     SvgPicture.asset("",),
              //     onPressed: () => jumpToPage(3),
              //   ),
            )
          ],
        ),
      ),
    );
  }


  _getproperTitle() {
    switch (_currentIndex) {
      case 0:
        return AppStrings.MyShop;
      case 1:
        return AppStrings.Favourite;
      case 2:
        return AppStrings.Orders;
      case 3:
        return AppStrings.Profile;
    }
  }

  jumpToPage(int i) {
    setState(() {
      _myPage.animateToPage(i,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }



}

