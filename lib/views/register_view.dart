import 'package:evcharge/widget/custom_button.dart';
import 'package:evcharge/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/snack_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String id = "RegisterView";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 30,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Image.asset(
                            logoImage,
                            width: 75,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      registerImage,
                      width: 160,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 29, 29, 29)),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "Register in EVCharge and make your life easier",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
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
                        hintText: "Password",
                        suffixIcon: tooglePassword()),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        onTap: () async {
                          if (keyForm.currentState!.validate()) {
                            keyForm.currentState!.save();
                            isLoading = true;
                            setState(() {});

                            try {
                              await Registration(context);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                snackBar(
                                    context,
                                    'The password provided is too weak.',
                                    Colors.red);
                              } else if (e.code == 'email-already-in-use') {
                                snackBar(
                                    context,
                                    'The account already exists for that email.',
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
                        text: "Create an account"),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            controllerEmail.clear();
                            controllerPassword.clear();
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
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

  Future<void> Registration(BuildContext context) async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    Navigator.pop(context);
    snackBar(context, "Registration has been completed successfully.",
        kPrimaryColor);
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
