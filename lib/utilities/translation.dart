import 'package:flutter/cupertino.dart';
import 'package:myshop/localization/AppLocalization.dart';

String translate(BuildContext context, String translation) {
  return AppLocalizations.of(context).translate(translation);
}
