import 'package:evcharge/constants.dart';
import 'package:flutter/material.dart';

class CustomTitleStation extends StatelessWidget {
  const CustomTitleStation({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 10,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontFamily: "NEOSANSW23"),
        )
      ],
    );
  }
}
