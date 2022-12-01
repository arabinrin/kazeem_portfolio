import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void cToast({required String msg, required BuildContext context}) {
  final ThemeData color = Theme.of(context);

  showTopSnackBar(
    dismissType: DismissType.onSwipe,
    Overlay.of(context)!,
    CustomSnackBar.success(
      iconPositionLeft: 8,
      textStyle: bodyTextStyle.copyWith(color:Colors.white),
      message: msg,
      backgroundColor: Colors.green.withOpacity(.9),
      icon: Icon(Icons.info_rounded, color: color.primaryColor),
    ),
  );
}
