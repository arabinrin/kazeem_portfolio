import 'package:kazeem_portfolio/pages/contact_page.dart';
import 'package:kazeem_portfolio/pages/experience_page.dart';
import 'package:kazeem_portfolio/pages/home_page.dart';
import 'package:kazeem_portfolio/pages/portfolio_page.dart';
import 'package:kazeem_portfolio/pages/team_page.dart';
import 'package:kazeem_portfolio/utils/AppColors.dart';
import 'package:kazeem_portfolio/utils/AppIcons.dart';
import 'package:kazeem_portfolio/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  int selectedMenuIndex = 0;
  final databaseRef = FirebaseDatabase.instance.ref().child("Portfolio");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 5, vsync: this);

    _tabController!.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: backgroundLight,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/passport.jpeg"),
                    ),
                    NavigationMenu(navHome,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 0, onClick: () {
                      _tabController!.animateTo(0);
                    }),
                    NavigationMenu(navTime,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 1, onClick: () {
                      _tabController!.animateTo(1);
                    }),
                    NavigationMenu(navPortfolio,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 2, onClick: () {
                      _tabController!.animateTo(2);
                    }),
                    NavigationMenu(navGroup,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 3, onClick: () {
                      _tabController!.animateTo(3);
                    }),
                    NavigationMenu(navContact,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 4, onClick: () {
                      _tabController!.animateTo(4);
                    }),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomePage(databaseRef),
                      ExperiencePage(),
                      PortfolioPage(),
                      TeamPage(),
                      ContactPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
