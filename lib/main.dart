import 'package:budget_tracker_ui/pages/login_page.dart';
import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: login(),
     );
   }
 }

