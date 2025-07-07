import 'package:evcharge/constants.dart';
import 'package:evcharge/helper/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../views/about_evcharge_view.dart';
import '../views/contact_view.dart';
import '../views/login_view.dart';
import 'custom_list_tile.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Menu",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 35,
                      fontFamily: "NEOSANSW23"),
                ),
                SizedBox(
                  height: 24,
                ),
                CustomListTile(
                  text: "About EVCharge",
                  leadingIcon: Icons.report_gmailerrorred_outlined,
                  onPressed: () {
                    Navigator.pushNamed(context, AboutEvChargeView.id);
                  },
                ),
                CustomListTile(
                  text: "Contact Us",
                  leadingIcon: Icons.contact_support,
                  onPressed: () {
                    Navigator.pushNamed(context, ContactView.id);
                  },
                ),
                CustomListTile(
                  text: "Sign Out",
                  leadingIcon: Icons.logout,
                  color: Colors.red,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed(LoginView.id);
                    snackBar(context, "Log Out successfully", kPrimaryColor);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
