import 'package:expense/app/controllers/settings.dart';
import 'package:expense/app/ui/screens/profile/settings.dart';
import 'package:expense/app/ui/theme/app_font.dart';
import 'package:expense/app/ui/widget/common_textform_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import 'common_text.dart';

commonAlertDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.red),
      child: const Center(
        child: CommonText(text: "Cancel", fontColor: AppColors.white),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary.withOpacity(0.7)),
      child: const Center(
        child: CommonText(text: "Confirm", fontColor: AppColors.white),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    backgroundColor: Colors.black54,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        CommonText(
          text: "Alert",
          fontColor: Colors.white,
          fontSize: AppFontSize.twentyFour,
        )
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(text: content, fontSize: 16, fontColor: AppColors.white),
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

commonDeleteDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.black.withOpacity(0.8)),
      child: const Center(
        child: CommonText(text: "Go back", fontColor: AppColors.white),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondary,
      ),
      child: const Center(
        child: CommonText(text: "Delete", fontColor: AppColors.white),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    backgroundColor: Colors.black54,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        CommonText(
          text: "Delete?",
          fontColor: Colors.white,
          fontSize: AppFontSize.twentyFour,
        )
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(text: content, fontSize: 16, fontColor: AppColors.white),
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

successAlert(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  var media = MediaQuery.of(context).size;
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      // height: 30,
      width: media.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green),
      child: const Center(
        child: CommonText(
          text: "Ok",
          fontColor: AppColors.white,
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: content,
            )
          ],
        ),
        SizedBox(
          height: media.width * 0.02,
        ),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black.withOpacity(.1),
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.green,
              size: 35,
            )),
      ],
    ),
    actions: [
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

bugReport(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  var media = MediaQuery.of(context).size;
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      // height: 30,
      width: media.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.primary),
      child: const Center(
        child: CommonText(
          text: "Send Message to Developer",
          fontColor: AppColors.black,
          fontWeight: FontWeight.bold,
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
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: content,
              fontColor: AppColors.secondary,
            )
          ],
        ),
        SizedBox(
          height: media.width * 0.02,
        ),
        Form(
          key: SettingsController.to.bugKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Bug Title",
                fontColor: AppColors.white,
              ),
              CommonTextFormField(
                hintText: "Enter bug title",
                controller: SettingsController.to.bugTitle,
                validator: (data){
                  if(data==null||data=="")
                    {
                      return 'Please enter bug title';
                    }
                  return null;
                },
              ),
              CommonText(
                text: "Bug Report",
                fontColor: AppColors.white,
              ),
              CommonTextFormField(
                maxLines: 6,
                inputType: TextInputType.multiline,
                hintText: "Enter bug description",
                controller: SettingsController.to.bugDescription,
                validator: (data){
                  if(data==null||data=="")
                  {
                    return 'Please enter bug description';
                  }
                  return null;
                },
              ),
            ],
          ),
        )
      ],
    ),
    actions: [
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

errorAlert(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  var media = MediaQuery.of(context).size;
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      // height: 30,
      width: media.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primary,
        // gradient: const LinearGradient(
        //     colors: [AppColors.primary, AppColors.buttonGradient],
        //     begin: Alignment.topRight,
        //     end: Alignment.topLeft),
      ),
      child: const Center(
        child: CommonText(
          text: "Ok",
          fontColor: AppColors.white,
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              textAlign: TextAlign.center,
              text: content,
            )
          ],
        ),
        SizedBox(
          height: media.width * 0.02,
        ),
        const Icon(
          Icons.cancel,
          color: AppColors.red,
          size: 35,
        ),
      ],
    ),
    actions: [
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

rejectDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
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
          style: TextStyle(color: AppColors.black),
        ),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Get.back();
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
          style: TextStyle(color: AppColors.black),
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
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        CommonText(text: "Alert")
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: AppColors.black),
        ),
        // SizedBox(
        //   // height: 60,
        //     width: media.width,
        //     child: Form(
        //         key: DriverController.to.rejectKey,
        //         child: TextFormField(
        //           controller: DriverController.to.rejectReason,
        //           decoration:
        //           const InputDecoration(hintText: "enter reject reason"),
        //           validator: (data) {
        //             if (data!.isEmpty || data == "") {
        //               return commonToast(msg: "please fill the reject reason");
        //             } else if (data.length < 8) {
        //               return commonToast(msg: "reason minimum 8 char");
        //             }
        //             return null;
        //           },
        //         )))
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

updateAlertDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
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
          style: TextStyle(color: AppColors.black),
        ),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Get.back();
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
          "Update",
          style: TextStyle(color: AppColors.black),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    alignment: Alignment.bottomCenter,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    backgroundColor: Colors.grey.shade300,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [CommonText(text: "Update Available")],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: AppColors.black),
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

dynamic loadingAlertDialog(BuildContext context, {required Widget child}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      content: child);

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
