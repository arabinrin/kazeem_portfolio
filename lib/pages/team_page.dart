// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';
import 'package:kazeem_portfolio/utils/common_string.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';


class TeamPage extends StatelessWidget {
  var descriptions =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Our Team',
              style: headerTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: bodyTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            _itemWidget('Jhon Deo', 'assets/avtar1.png', descriptions),
            _itemWidget('Jhon Deo', 'assets/avtar2.png', descriptions),
            _itemWidget('Jhon Deo', 'assets/avtar3.png', descriptions),
            _itemWidget('Jhon Deo', 'assets/avtar4.png', descriptions),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(String name,String image,String description) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
        color: cardBGColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: subHeaderTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
