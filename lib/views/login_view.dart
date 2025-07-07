import 'package:evcharge/views/register_view.dart';
import 'package:evcharge/views/station_home_view.dart';
import 'package:evcharge/widget/custom_button.dart';

import 'package:evcharge/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/snack_bar.dart';
import '../widget/custom_coulmn_item.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static String id = "LoginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool isLoading = false;
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Form(
                key: keyForm,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomCoulmnItem(),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 29, 29, 29)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9._%±]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$")
                            .hasMatch(value!);

                        if (value.isEmpty) {
                          return "Field is required";
                        }

                        if (!emailValid) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmail,
                      hintStyle: const TextStyle(color: Colors.grey),
                      onchange: (value) {
                        email = value;
                      },
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else if (value.length < 6) {
                          return "Password Length should be more 6 characters ";
                        }
                        return null;
                      },
                      controller: controllerPassword,
                      hintStyle: const TextStyle(color: Colors.grey),
                      onchange: (value) {
                        password = value;
                      },
                      obscureText: isSecure,
                      suffixIcon: tooglePassword(),
                      hintText: "Password",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        onTap: () async {
                          if (keyForm.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});

                            try {
                              await Login(context);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-credential') {
                                snackBar(
                                    context,
                                    "Please check your email address and password",
                                    Colors.red);
                              }
                            } catch (e) {
                              snackBar(
                                  context,
                                  "There is an error, please try again later.",
                                  Colors.red);
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          controllerEmail.clear();
                          controllerPassword.clear();
                          isLoading = false;
                          setState(() {});
                        },
                        text: "Log in"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterView.id);
                            controllerEmail.clear();
                            controllerPassword.clear();
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "By continuing, you agree to",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "the  terms  and  conditions ",
                      style: TextStyle(
                          fontSize: 17,
                          color: kPrimaryColor,
                          fontFamily: "NEOSANSW23"),
                    ),
                    Text(
                      " and  privacy  policy ",
                      style: TextStyle(
                          fontSize: 17,
                          color: kPrimaryColor,
                          fontFamily: "NEOSANSW23"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "of this application",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Login(BuildContext context) async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    Navigator.pushNamed(context, StationHomeView.id);
    snackBar(context, "Login successfully", kPrimaryColor);
  }

  Widget tooglePassword() {
    return IconButton(
        onPressed: () {
          isSecure = !isSecure;
          setState(() {});
        },
        icon: isSecure
            ? Icon(
                Icons.visibility_off,
                color: kPrimaryColor,
              )
            : Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ));
  }
}
