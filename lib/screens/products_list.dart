import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/bloc/products_list/products_list_bloc.dart';
import 'package:myshop/bloc/products_list/products_list_event.dart';
import 'package:myshop/bloc/products_list/products_list_state.dart';
import 'package:myshop/models/products/products.dart';
import 'package:myshop/models/products_list/products_list.dart';
import 'package:myshop/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/res/images.dart';
import 'package:myshop/res/strings.dart';
import 'package:myshop/widgets/app_bar.dart';
import 'package:myshop/widgets/loading.dart';
import 'package:myshop/widgets/m_container.dart';
import 'package:myshop/widgets/m_text.dart';

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
              //   Container(
              //   child: ListView(children: [
              //     Row(
              //       children: [
              //         Expanded(
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: 16.w, vertical: 16.h),
              //             child: MText(
              //               text: AppStrings.OurProducts,
              //             ),
              //           ),
              //         ),
              //          buildSort(),
              //       ],
              //     ),
              //   ]),
              // );
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
              buildSort(),
            ],
          ),
          buildProductsList(productsList),
        ],
      ),
    );
  }
  Widget buildProductsList(List<ProductsListModel>productsList,) {
    // if (_products.isEmpty) {
    //   if (_loading) {
    //     return Loading();
    //   } else if (_error) {
    //     return Center(
    //         child: InkWell(
    //       // onTap: () {
    //       //   setState(() {
    //       //     _loading = true;
    //       //     _error = false;
    //       //     fetchProducts();
    //       //   });
    //       // },
    //       child: Padding(
    //         padding: const EdgeInsets.all(16),
    //         child: Text("Error while loading photos, tap to try agin"),
    //       ),
    //     ));
    //   }
    // } else {
    return Container(
      height: size.height,
      width: size.width,
      child:

      GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildItemCard(productsList[index]);

            // GridView.count(
            //   crossAxisCount: 3,
            //   crossAxisSpacing: 4.0,
            //   mainAxisSpacing: 8.0,
            //   children: List.generate(products.length, (index) {
            //     return Center(
            //       //child: buildItemCard(products),
            //     );
            //   }
            //   ),
            //
            // //   ListView(
            // //     scrollDirection: Axis.horizontal,
            // //
            // //     shrinkWrap: true,
            // //     physics: ClampingScrollPhysics(),
            // //     children:
            // //     products.map((e) =>
            // //         buildItemCard(
            // //             e
            // //         )).toList()
            // // ),
            //
            //
            // ),
          } ,

            ),   );
    //}
    return Container();
  }
  Widget buildItemCard(ProductsListModel productsListModel) {
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
                        tag: "${productsListModel.id}",
                       child: Image.network(
                         "${productsListModel.image}"?? '',
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
                      text: "${productsListModel.title}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: MText(
                          color: AppColors.secondColor,
                         text: "\$${productsListModel.price}",
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
  Widget buildSort() {
    return Expanded(
      child: ExpansionPanelList(
        // elevation: 0,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: MText(
                  text: AppStrings.Sort,
                ),
              );
            },
            body: ListTile(
              title: Text('Item 1 child'),
              subtitle: Text('Details goes here'),
            ),
            isExpanded: false,
          ),
        ],
      ),
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

Future<void> fetchProducts() async {

    final response = await http.get(
        "https://fakestoreapi.com/products");
    var products = List<ProductsListModel>();
    if (200 == response.statusCode) {
      var productsJson = json.decode(response.body);
      for(var productsJson in productsJson){
        products.add(ProductsListModel.fromJson(productsJson));
      }
    }
    return products;

}
}

