import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 16),
      )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 242, 242, 242),
      ),
    );
  }
}
