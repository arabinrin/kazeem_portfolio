import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kazeem_portfolio/model/experience.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Professional Experience",
              style: headerTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * .85,
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemWidget(
                    experiences[index].role!,
                    experiences[index].duties,
                    context,
                    experiences[index].period!,
                                        experiences[index].place!,

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(
      String title, List<String>? description, context, String period,String place) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .3,
      width: width,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 10),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        subHeaderTextStyle.copyWith(color: Colors.blueAccent),
                  ),
                  Text(period,
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      )),
                  Text(place,
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        fontStyle: FontStyle.italic
                      )),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(width: 2, color: Colors.grey)),
            ),
            child: Container(
              width: width,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: cardBGColor,
              ),
              child: Container(
                height: height * .2,
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: height * .3,
                      width: width * .63,
                      child: ListView.builder(
                        itemCount: description!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '•',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 3.w),
                              SizedBox(
                                width: width * .6,
                                child: Text(
                                  ' ${description[index]}\n',
                                  style: bodyTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
