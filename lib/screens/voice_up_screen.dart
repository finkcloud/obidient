import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../constants.dart';

class VoiceUpScreenTab extends StatefulWidget {
  const VoiceUpScreenTab({Key? key}) : super(key: key);

  @override
  State<VoiceUpScreenTab> createState() => _VoiceUpScreenTabState();
}

class _VoiceUpScreenTabState extends State<VoiceUpScreenTab> {
  TextEditingController _Controller = TextEditingController();
  String age = "-";

  @override
  void initState() {
    super.initState();
    if (_Controller.text == "") {
      setState(() {
        age = "-";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Form(
                  child: TextFormField(
                    maxLength: 2,
                    controller: _Controller,
                    onChanged: (text) {
                      setState(() {
                        age = text.isNotEmpty
                            ? (int.parse(text) + 8).toString()
                            : "";
                      });

                      if (_Controller.text == "") {
                        setState(() {
                          age = "-";
                        });
                      }
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      hintText: "Enter age",
                      //add prefix icon
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.info(
                              message:
                                  "You saw your age, please get your PVC now!",
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.calculate_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter age';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 22),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      age,
                      textAlign: TextAlign.center,
                      textScaleFactor: 4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Text(
              //     "How old will you be in 8 years?",
              //     textScaleFactor: 2,
              //     style: TextStyle(fontWeight: FontWeight.w900),
              //   ),
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              //   child: Text(
              //     "Check above This will give you context!, of what is at stake in 2023, so your decision wont be an emotional one, but the one you will be held accountable for by your children and your old self, if you screw this up",
              //     textScaleFactor: 1,
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                  height: 400, child: Markdown(data: POAppConstants.angerMd)),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/street.JPG",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
