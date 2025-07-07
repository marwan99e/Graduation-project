import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:evcharge/constants.dart';
import 'package:evcharge/widget/Report_malfunction.dart';
import 'package:evcharge/widget/calculate.dart';
import 'package:evcharge/widget/settings.dart';
import 'package:flutter/material.dart';

import '../widget/station_body_items.dart';

class StationHomeView extends StatefulWidget {
  const StationHomeView({super.key});

  static String id = "StationHomeView";

  @override
  State<StationHomeView> createState() => _StationHomeViewState();
}

int currentIndex = 0;
List<Widget> listWidget = [
  const StationBodyItems(),
  const Calculate(),
  const ReportMalfunction(),
  const Menu(),
];

class _StationHomeViewState extends State<StationHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        initialActiveIndex: currentIndex,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          TabItem(
              icon: Icon(Icons.home),
              title: "Home",
              activeIcon: Icon(
                Icons.home,
                color: kPrimaryColor,
                size: 30,
              )),
          TabItem(
              icon: Icon(Icons.calculate),
              title: "Calculate",
              activeIcon: Icon(
                Icons.calculate,
                color: kPrimaryColor,
                size: 30,
              )),
          TabItem(
              icon: Icon(Icons.report),
              title: "Report",
              activeIcon: Icon(
                Icons.report,
                color: kPrimaryColor,
                size: 30,
              )),
          TabItem(
              icon: Icon(Icons.settings),
              title: "Settings",
              activeIcon: Icon(
                Icons.settings,
                color: kPrimaryColor,
                size: 30,
              )),
        ],
      ),
      body: listWidget.elementAt(currentIndex),
    );
  }
}
