import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/bloc/products/products_bloc.dart';
import 'package:myshop/bloc/products/products_event.dart';
import 'package:myshop/bloc/products/products_state.dart';
import 'package:myshop/bloc/products_list/products_list_bloc.dart';
import 'package:myshop/bloc/products_list/products_list_event.dart';
import 'package:myshop/bloc/products_list/products_list_state.dart';
import 'package:myshop/models/products/product.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products/products_response.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
import 'package:myshop/res/strings.dart';
import 'package:myshop/screens/favourite.dart';
import 'package:myshop/utilities/internetConnectivity.dart';
import 'package:myshop/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop/widgets/floating_action.dart';
import 'package:myshop/widgets/item_card.dart';
import 'package:myshop/widgets/loading.dart';
import 'package:myshop/widgets/m_container.dart';
import 'package:myshop/widgets/m_text.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/widgets/sort.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ProductsModel productsModel;
  // ProductsResponse productsResponse;

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
    // productsModel = ModalRoute.of(context).settings.arguments;
    // productsResponse = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: AppColors.mWhite,
      body: buildPageView(),
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton: _currentIndex == 0 ? FloatingActionWidget() : null,
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
    return BlocProvider<ProductsBloc>(
      create: (_) => ProductsBloc()..add(FetchProducts()),
      child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Loading();
            }
            if (state is ProductsSuccess) {
              print("data");
              return buildHomeBody(state.data);
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

  Widget buildHomeBody(List<ProductsModel> products) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
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
                //  SortWidget(),
              ],
            ),
            buildProductsList(products),
          ],
        ),
      ),
    );
  }

  Widget buildProductsList(List<ProductsModel> products) {
    return Container(
      height: size.height,
      width: size.width,
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return buildItemCard(products[index]);
          }),
    );
  }

  Widget buildItemCard(ProductsModel productsModel) {
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
                        child: Image.network(
                          "${productsModel.frontImage}" ?? '',
                        ),
                      ),
                      height: size.height,
                      width: size.width,
                      //child: text,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: MText(
                      text: "${productsModel.title}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
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
                left: 110.w,
                child: InkWell(
                  onTap: () {
                    Clicked();
                  },
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

  // Future<void> fetchProducts() async {
  //   try {
  //     final response = await http.get(
  //         "https://jsonplaceholder.typicode.com/photos?_page=$_pageNumber");
  //     List<Product> fetchedProducts =
  //         Product.parseList(json.decode(response.body));
  //     setState(() {
  //       _hasMore = fetchedProducts.length == _defaultPhotosPerPageCount;
  //       _loading = false;
  //       _pageNumber = _pageNumber + 1;
  //       _products.addAll(fetchedProducts);
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _loading = false;
  //       _error = true;
  //     });
  //   }
  // }
}

///UnUsed_Code
// // int  get count =>list.length;
//   // List<int> list = [];
//   // void load() {
//   //   print("load");
//   //   setState(() {
//   //     list.addAll(List.generate(15, (v) => v));
//   //     print("data count = ${list.length}");
//   //   });
//   // }
// child: LoadMore(
//   isFinish: count >= 60,
//   onLoadMore: _loadMore,
//   whenEmptyLoad: false,
//   delegate: DefaultLoadMoreDelegate(),
// Future<bool> _loadMore() async {
//     print("onLoadMore");
//     await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
//     load();
//     return true;
//   }
//
//   Future<void> _refresh() async {
//     await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
//     list.clear();
//     load();
//   }
