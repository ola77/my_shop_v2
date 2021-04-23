import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class MBusyStackWidget extends StatelessWidget {
  final Widget child;
  final bool visibility;
  final bool isForDialog;
  MBusyStackWidget({this.child, this.isForDialog = false, this.visibility});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isForDialog
            ? Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight)
            : Container(),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 0,
          child: Visibility(
            visible: visibility ?? false,
            child: Container(
              color: Colors.black.withOpacity(.3),
              child: Center(
                child: BusyWidget(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
