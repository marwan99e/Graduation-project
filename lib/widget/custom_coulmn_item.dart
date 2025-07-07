import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCoulmnItem extends StatelessWidget {
  const CustomCoulmnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          logoImage,
          width: 160,
        ),
        const Text(
          "EVCharge",
          style: TextStyle(
              fontFamily: "NEOSANSW23",
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xff0183c8)),
        ),
        Text(
          "Electric Vehicle Charge",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: kPrimaryColor),
        ),
      ],
    );
  }
}
