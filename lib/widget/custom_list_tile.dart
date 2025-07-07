import 'package:flutter/material.dart';

import '../constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.leadingIcon,
    this.onPressed,
    this.color = const Color(0xff0183c8),
  });
  final String text;
  final IconData leadingIcon;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        color: Color.fromARGB(255, 252, 252, 252),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          leading: Icon(
            leadingIcon,
            color: color,
          ),
          trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kPrimaryColor,
              )),
        ),
      ),
    );
  }
}
