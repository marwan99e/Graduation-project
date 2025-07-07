import 'package:evcharge/widget/custom_alert_dialog.dart';
import 'package:evcharge/widget/custom_button.dart';
import 'package:evcharge/widget/custom_text_form_field.dart';
import 'package:evcharge/widget/google_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';
import 'custom_phone_field.dart';

class ReportMalfunction extends StatefulWidget {
  const ReportMalfunction({super.key});

  @override
  State<ReportMalfunction> createState() => _ReportMalfunctionState();
}

class _ReportMalfunctionState extends State<ReportMalfunction> {
  String? name, phone;
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: keyForm,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.report_problem_rounded,
                  color: kPrimaryColor,
                  size: 150,
                ),
                Text(
                  "Is your car running out of charge?",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontFamily: "NEOSANSW23"),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Don't worry, we have a special team for this problem to transport your car to the nearest possible station, just send the attached information in front of you, and we will reach you as soon as possible.",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: controllerName,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "please write your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                  hintText: "Your name",
                ),
                SizedBox(
                  height: 16,
                ),
                CustomPhoneField(
                  controller: controllerPhone,
                  onSaved: (value) {
                    phone = value.toString();
                    print(phone);
                  },
                  hintText: "Your phone",
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: CustomGoogleMap(
                      latLng: LatLng(
                        0,
                        0,
                      ),
                      zoom: 17,
                    )),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                    onTap: () {
                      if (keyForm.currentState!.validate()) {
                        ShowDialog(context);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      controllerName.clear();
                      controllerPhone.clear();
                    },
                    text: "Submite")
              ],
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
          content:
              "Your request has been submitted, we will be with you as soon as possible.",
        );
      },
    );
  }
}
