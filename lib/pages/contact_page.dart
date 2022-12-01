import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("RECOMMENDATION",style: headerTextStyle,),
            SizedBox(height: 10,),
            _itemWidget("Email","kazeemibrahim@gmail.com"),
            _itemWidget("Mobile","+2349037893102 "),
                        _itemWidget("GitHub",":https://github.com/arabinrin"),

          ],
        ),
      ),
    );
  }
  Widget _itemWidget(String title,String value){
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: subHeaderTextStyle,),
          Text(value,style: bodyTextStyle,),
        ],
      ),
    );
  }
}
