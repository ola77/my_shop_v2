import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:myshop/models/color.dart';
import 'package:myshop/models/size.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/text_styles.dart';


import 'msize_boxes.dart';
import 'mtext_display.dart';

class MColorSizeList extends StatefulWidget {
  final List<ColorModel> colors;
  final List<SizeModel> sizes;
  final Function(int) onChang;
  final bool spacerVisibility;
  final int selectedItem;
  MColorSizeList(
      {this.colors,
      this.spacerVisibility = true,
      this.selectedItem,
      this.sizes,
      this.onChang});

  @override
  _MColorSizeListState createState() => _MColorSizeListState();
}

class _MColorSizeListState extends State<MColorSizeList> {
  bool isSize;
  List<Color> colors;
  int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.selectedItem;
    isSize = widget.sizes != null;
    if (!isSize) {
      colors = widget.colors
          .map((e) => Color(int.parse(e.code, radix: 16) + 0xFF000000))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      child: Row(
        children: [
          ListView.builder(
            itemCount: isSize ? widget.sizes.length : widget.colors.length,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (isSize) {
                        selectedIndex = widget.sizes[index].id;
                        widget.onChang(widget.sizes[index].id);
                      } else {
                        selectedIndex = widget.colors[index].id;
                        widget.onChang(widget.colors[index].id);
                      }
                    });
                  },
                  child: Center(
                    child: isSize
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.w),
                                border: Border.all(
                                  width: selectedIndex == widget.sizes[index].id
                                      ? 2
                                      : 1,
                                  color: selectedIndex == widget.sizes[index].id
                                      ? Colors.black87
                                      : AppColors.GRAY,
                                )),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            child: MTextDisplay(
                              text: widget.sizes[index].title,
                              textStyle: AppTextStyles.medium_18
                                  .copyWith(color: AppColors.GRAY),
                            ),
                          )
                        : Container(
                            padding: selectedIndex == widget.colors[index].id
                                ? EdgeInsets.all(4)
                                : EdgeInsets.zero,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.w),
                                border: Border.all(
                                  color: colors[index],
                                )),
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.circular(6.w),
                              ),
                            ),
                          ),
                  ),
                ),
                MWidth(
                  width: 10,
                )
              ],
            ),
          ),
          Visibility(visible: widget.spacerVisibility, child: Spacer())
        ],
      ),
    );
    ;
  }
}
