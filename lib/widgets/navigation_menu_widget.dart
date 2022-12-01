import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';
import 'package:kazeem_portfolio/widgets/svg_loader.dart';

Widget NavigationMenu(
  String? icon, {
  bool isSelected = false,
  double? height,
  double? width,
  Function()? onClick,
}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          svgLoader(icon, height: height!, width: width!),
          Container(
            margin: const EdgeInsets.all(8),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: isSelected ? navigationSelectionColor : Colors.transparent,
            ),
          )
        ],
      ),
    ),
  );
}
