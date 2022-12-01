import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/model/portfolio.dart';
import 'package:kazeem_portfolio/pages/main_page.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';
import 'package:kazeem_portfolio/utils/common_string.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';
import 'package:kazeem_portfolio/widgets/app_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Portfolio', style: headerTextStyle),
            SizedBox(
              height: 30.h,
            ),
            Text('Some Published And Ongoing Application by kazeem Ibrahim in 2022 ',
                style: subHeaderTextStyle.copyWith(color: Colors.black),
                textAlign: TextAlign.center,),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: height * .6,
              child: ListView.builder(
                itemCount: portfolios.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 60.h,
                                width: 60.w,
                                child: Image.asset(portfolios[index].image!)),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  portfolios[index].name!,
                                  style: subHeaderTextStyle,
                                ),
                                SizedBox(
                                  width: width * .45,
                                  child: Text(
                                    portfolios[index].function!,
                                    style: bodyTextStyle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(double width,
      {String? name, String? image, String? description}) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {
          scaffoldkey.currentState!.showBottomSheet((context) {
            return Container(
              color: backgroundLight,
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    color: cardBGColor,
                    child: AppImageWidget(
                      imageUrl: image!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(name!, style: subHeaderTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(description!, style: bodyTextStyle),
                  ),
                ],
              ),
            );
          });
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: cardBGColor,
                  // image: DecorationImage(image: Image.network(image).image),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    image!,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
