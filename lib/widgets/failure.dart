import 'package:flutter/material.dart';
import 'package:myshop/res/text_styles.dart';

import 'mtext_display.dart';

class Failure extends StatelessWidget {
  final String text;

  Failure({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MTextDisplay(
        text: text,
        textStyle: AppTextStyles.medium_14,
      ),
    );
  }
}
