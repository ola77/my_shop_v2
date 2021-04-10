import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:myshop/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(320, 676),
    allowFontScaling: false,
    builder: () => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    ),

    routes: AppRoute.routes,
    initialRoute: AppRoute.Home,
    ),
    );
  }
}
