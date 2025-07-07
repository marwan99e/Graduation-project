import 'package:evcharge/views/auth_gate.dart';
import 'package:evcharge/views/login_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIsLogin();
    super.initState();
  }

  var auth = FirebaseAuth.instance;
  bool isLogin = false;

  checkIsLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        isLogin = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? AuthGate() : LoginView();
  }
}
