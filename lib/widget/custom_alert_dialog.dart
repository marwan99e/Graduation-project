import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Submitted"),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.check,
            color: kPrimaryColor,
            size: 30,
          )
        ],
      ),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close")),
      ],
    );
  }
}
