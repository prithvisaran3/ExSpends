import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/theme/colors.dart';

var rupee = "\u20B9";

String formatAmount({required amount}) {
  var formatter = NumberFormat('#,##,###');
  var v = formatter.format(amount);
  debugPrint("formatted amount is $v");
  return v;
}

int stringToInt({required text}) {
  var myInt = int.parse(text);
  debugPrint("$myInt");
  return myInt;
}

double stringToDouble({required text}) {
  var myInt = double.parse(text);
  debugPrint("$myInt");
  return myInt;
}

String dateToYear({required date}) {
  var d = date;
  final year = DateFormat.yM().format(DateTime.parse(d));
  debugPrint("year is $year");
  return year;
}

String monthNameToMonthNumber({required String date}) {
  var dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('MM');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String monthNameToMonthNumberForAnalytics({required String date}) {
  var dateTime = DateFormat("dd-MM-yyyy").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('MM');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String dateSeparate({required String date}) {
  var dateTime = DateFormat("dd-MM-yy").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('dd');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String yearSeparate({required String date}) {
  var dateTime = DateFormat("dd-MM-yy").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('yyyy');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String normalDateToIndividualYear({required String date}) {
  var dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('yy');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String getIsoToLocalTime({required String date}) {
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('hh:mm a');
  var outputDate = outputFormat.format(localTime);
  return outputDate;
}

String SendIsoToLocalDate({required String date}) {
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('yyyy-MM-dd');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String getIsoToLocalDate({required String date}) {
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('dd-MM-yy');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String getIsoToLocalDateDaily({required date}) {
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('yyyy-MM-dd');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String months({required month}) {
  var m = "";
  if (month == "01") {
    m = "JAN";
  } else if (month == "02") {
    m = "FEB";
  } else if (month == "03") {
    m = "MAR";
  } else if (month == "04") {
    m = "APR";
  } else if (month == "05") {
    m = "MAY";
  } else if (month == "06") {
    m = "JUN";
  } else if (month == "07") {
    m = "JUL";
  } else if (month == "08") {
    m = "AUG";
  } else if (month == "09") {
    m = "SEB";
  } else if (month == "10") {
    m = "OCT";
  } else if (month == "11") {
    m = "NOV";
  } else {
    m = "DEC";
  }
  return m;
}

String monthsNameToNumber({required month}) {
  var m = "";
  if (month == "Jan") {
    m = "1";
  } else if (month == "Feb") {
    m = "2";
  } else if (month == "Mar") {
    m = "3";
  } else if (month == "Apr") {
    m = "4";
  } else if (month == "May") {
    m = "5";
  } else if (month == "Jun") {
    m = "6";
  } else if (month == "Jul") {
    m = "7";
  } else if (month == "Aug") {
    m = "8";
  } else if (month == "Sep") {
    m = "9";
  } else if (month == "Oct") {
    m = "10";
  } else if (month == "Nov") {
    m = "11";
  } else {
    m = "12";
  }
  return m;
}

String addSpace({required String text}) {
  var t =
      text.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  return t;
}

String getCurrentDate() {
  var currentTime = DateTime.now();
  var time = DateFormat('dd-MM-yyyy').format(currentTime);
  return time;
}

String monthyearSeparate({required String date}) {
  var dateTime = DateFormat("dd-MM-yy").parse(date, true);
  // var localTime = dateTime.toLocal();
  var outputFormat = DateFormat('MM-yy');
  var outputDate = outputFormat.format(dateTime);
  return outputDate;
}

openBrowser({required url}) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
