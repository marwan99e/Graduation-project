import 'package:evcharge/constants.dart';
import 'package:flutter/material.dart';

import '../widget/custom_coulmn_item.dart';
import '../widget/custom_social_media.dart';
import '../widget/custom_title_station.dart';

class AboutEvChargeView extends StatelessWidget {
  const AboutEvChargeView({super.key});

  static String id = "AboutEvChargeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kPrimaryColor,
          ),
        ),
        elevation: 2,
        centerTitle: true,
        title: Text(
          "About EVCharge",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Column(
          children: [
            CustomCoulmnItem(),
            SizedBox(
              height: 24,
            ),
            CustomTitleStation(
              text: "Who're We",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "EVCharge is your go-to destination for hassle-free electric vehicle charging. Our extensive network of charging stations provides a seamless charging experience wherever you go. With our smart app, you can easily locate the nearest available charging station and start charging in no time.",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            CustomSocialMedia(),
          ],
        ),
      ),
    );
  }
}
