import 'package:evcharge/constants.dart';
import 'package:evcharge/model/price_model.dart';
import 'package:evcharge/widget/custom_button.dart';
import 'package:evcharge/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../services/get_price.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController controllerUserInput = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  double userInput = 0;
  PriceModel priceModel = PriceModel(price: 0);
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 169, 169, 169),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 8))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isloading
                        ? CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : Text(
                            "${priceModel.price} JD",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                    const Text(
                      "Amount",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 50,
                      endIndent: 50,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    userInput == 0
                        ? Text(
                            "$userInput kWh",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        : Text("$userInput kWh",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                    const Text(
                      "Electricy used",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        width: 200,
                        child: CustomTextField(
                          maxLength: 4,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Field is Required To Calculate";
                            }
                            return null;
                          },
                          controller: controllerUserInput,
                          keyboardType: TextInputType.phone,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              userInput =
                                  double.parse(controllerUserInput.text);
                              autovalidateMode = AutovalidateMode.disabled;
                              isloading = true;
                              priceModel =
                                  await PriceInfo().getPrice(kWh: userInput);

                              setState(() {});
                              isloading = false;
                              setState(() {});
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                            controllerUserInput.clear();
                          },
                          text: "Calculate"),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 90,
                  top: -60,
                  child: Image.asset(
                    logoImage,
                    height: 100,
                    width: 150,
                  ))
            ],
          ),
        ));
  }
}
