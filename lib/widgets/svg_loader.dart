import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';

Widget svgLoader(String? image, {  double width = 20.0,double height = 20.0}) {
  return SvgPicture.asset(
    image!,
    height: height,
    width: width,
    color: iconTint,
  );
}
