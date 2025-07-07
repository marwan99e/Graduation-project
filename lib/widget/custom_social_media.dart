import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSocialMedia extends StatelessWidget {
  const CustomSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Folow us on",
          style: TextStyle(fontFamily: "NEOSANSW23"),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.telegram,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
          ],
        )
      ],
    );
  }
}
