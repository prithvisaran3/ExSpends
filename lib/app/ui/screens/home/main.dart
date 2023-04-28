import 'package:expense/app/controllers/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../theme/colors.dart';
import '../budget.dart';
import '../daily_transaction.dart';
import '../history.dart';
import '../profile/profile.dart';
import '../statistics.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key? key}) : super(key: key);
  List<Widget> pages = [
    DailyTransactions(),
    Statistics(),
    History(),
    Profile(),
    AddBudget()
  ];

  List<IconData> iconItems = [
    Ionicons.calendar_outline,
    Icons.auto_graph,
    Ionicons.document_text,
    Ionicons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
              backgroundColor: AppColors.black,
              activeColor: AppColors.primary,
              // splashColor: secondary,
              inactiveColor: Colors.white.withOpacity(0.5),
              icons: iconItems,
              activeIndex: MainController.to.pageIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 10,
              iconSize: 25,
              rightCornerRadius: 10,
              onTap: (index) {
                MainController.to.pageIndex = index;
              },
              //other params
            )),
        body: Obx(() => IndexedStack(
              index: MainController.to.pageIndex,
              children: pages,
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MainController.to.pageIndex = 4;
          },
          child: Icon(
            Icons.add,
            color: AppColors.black,
            size: 25,
          ),
          backgroundColor: AppColors.primary,
          //params
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
