import 'package:evcharge/constants.dart';
import 'package:flutter/material.dart';

import 'auth_gate.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({super.key});

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AuthGate();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              yarmoukLogo,
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text("Developed By",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: "NEOSANSW23")),
          SizedBox(
            height: 8,
          ),
          Text(
            "Ammar Aboalrub",
            style: TextStyle(color: Colors.grey),
          ),
          Text("Marwan Alrawashdeh", style: TextStyle(color: Colors.grey)),
          Text("Abdullah Alawneh", style: TextStyle(color: Colors.grey)),
          SizedBox(
            height: 40,
          ),
          Text("Supervisor By",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "NEOSANSW23")),
          SizedBox(
            width: 16,
          ),
          Text("Amera Jaradat",
              style: TextStyle(
                  color: Color.fromARGB(255, 76, 152, 78),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "NEOSANSW23")),
        ],
      ),
    );
  }
}
