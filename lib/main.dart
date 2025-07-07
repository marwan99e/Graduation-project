import 'package:evcharge/views/about_evcharge_view.dart';
import 'package:evcharge/views/contact_view.dart';
import 'package:evcharge/views/inside_card_item_view.dart';
import 'package:evcharge/views/login_view.dart';
import 'package:evcharge/views/register_view.dart';
import 'package:evcharge/views/spalsh_screen.dart';
import 'package:evcharge/views/station_home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "EVCharge",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EVCharge());
}

class EVCharge extends StatelessWidget {
  const EVCharge({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        StationHomeView.id: (context) => const StationHomeView(),
        AboutEvChargeView.id: (context) => const AboutEvChargeView(),
        InsideCardItemView.id: (context) => const InsideCardItemView(),
        ContactView.id: (context) => const ContactView(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashSceen(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white)),
    );
  }
}
