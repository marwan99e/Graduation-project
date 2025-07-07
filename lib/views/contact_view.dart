import 'package:evcharge/widget/custom_button.dart';
import 'package:evcharge/widget/custom_coulmn_item.dart';
import 'package:evcharge/widget/custom_social_media.dart';
import 'package:evcharge/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widget/custom_alert_dialog.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});
  static String id = "ContactView";

  @override
  State<ContactView> createState() => _ContactViewState();
}

String? subject, message;
GlobalKey<FormState> keyForm = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

TextEditingController controllerSubject = TextEditingController();
TextEditingController controllerMessage = TextEditingController();

bool isLoading = false;

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kPrimaryColor,
            ),
          ),
          elevation: 2,
          centerTitle: true,
          title: Text(
            "Contact Us",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Form(
            key: keyForm,
            autovalidateMode: autovalidateMode,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCoulmnItem(),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    controller: controllerSubject,
                    onSaved: (value) {
                      subject = value;
                    },
                    hintText: "The Subject",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    controller: controllerMessage,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "the message is requried";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      message = value;
                    },
                    maxLines: 6,
                    hintText: "The Message",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                      onTap: () {
                        if (keyForm.currentState!.validate()) {
                          isLoading = true;
                          autovalidateMode = AutovalidateMode.disabled;
                          setState(() {});

                          ShowDialog(context);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                        controllerMessage.clear();
                        controllerSubject.clear();
                        isLoading = false;
                        setState(() {});
                      },
                      text: "Send"),
                  SizedBox(
                    height: 24,
                  ),
                  CustomSocialMedia(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: "Your message has been sent successfully.",
        );
      },
    );
  }
}
