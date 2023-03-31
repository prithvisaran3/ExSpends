import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common_text.dart';
import 'common_toast.dart';

addCategoryDialogue(BuildContext context,
    {required String content,
    required Function() confirmButtonPressed,
    required key,
    required controller}) {
  var media = MediaQuery.of(context).size;
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      child: const Center(
        child: Text(
          "Cancel",
          style: TextStyle(color: black),
        ),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green),
      child: const Center(
        child: Text(
          "Confirm",
          style: TextStyle(color: black),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    backgroundColor: Colors.grey.shade300,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: const TextStyle(
              fontSize: 16, color: black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SizedBox(
          // height: 60,
          width: media.width,
          child: Form(
            key: key,
            child: TextFormField(
              controller: controller,
              decoration:
                  const InputDecoration(hintText: "Enter Category Name"),
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "please fill the category";
                }
                return null;
              },
            ),
          ),
        )
      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
