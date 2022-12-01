import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/controller/firebase_controller.dart';
import 'package:kazeem_portfolio/utils/common_string.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';
import 'package:kazeem_portfolio/widgets/app_shimmer_effect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage(this.databaseRef);

  final DatabaseReference databaseRef;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<String> skills =
      ' SQL • HTML • Flutter • Data science • Restful API • Digital marketing with google • Microsoft oﬃce management tools • Machine learning • Data analysis and analytics. Basic electronicsS'
          .split('•');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Text("Kazeem Ibrahim", style: headerTextStyle),
          ),
          Text("FLUTTER DEVELOPER", style: headerTextStyle),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              'A software developer with years of experience in building android applications with several architecture patterns. I am accustomed to heading up successful development teams through agile direction and careful delegation. Willing to direct large-scale teams or work hands-on to complete extremely difficult projects. Brings both cutting-edge programming expertise and exceptional interpersonal skills to leadership roles.\n\n I have also performed well in other technical areas like training and support. I am an exceptional team player with an analytical approach to development, translating designs to reality in the simplest form. I have developed and am working on a social media app that allows users to share media and real-time chat using Firebase components. I can also be flexible and quick to understand customers needs and improve aspects that need improvement.',
              style: bodyTextStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Education", style: headerTextStyle),
          Text("Federal University of Agriculture, Abeokuta",
              style: subHeaderTextStyle),
          Text(
            'B.sc (Mathematics)  (2015 - 2020)',
            style: bodyTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Skills", style: headerTextStyle),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Text('•'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      skills[index],
                      style: bodyTextStyle,
                    ),
                  ],
                );
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
