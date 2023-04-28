import 'package:expense/app/controllers/daily.dart';
import 'package:expense/app/ui/theme/colors.dart';

import 'package:expense/app/ui/widget/common_loading.dart';
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/daily/daily_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widget/daily/dailyappbar.dart';
import '../widget/daily/grandtotalcard.dart';

class DailyTransactions extends StatelessWidget {
  const DailyTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
      init: DailyController(),
      initState: (_) {
        DailyController.to.selectedDate = DateTime.now().toString();
        DailyController.to.getDailyTransactions();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 230, left: 20, right: 20),
                    child: Obx(
                      () => DailyController.to.dailyloading == true
                          ? CommonNormalLoading()
                          : DailyController.to.dailyEmpty == true
                              ? Column(
                                  children: [
                                    CommonText(
                                      text: "DATA EMPTY",
                                      fontColor: AppColors.white,
                                    ),
                                  ],
                                )
                              :
                      DailyTile(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GrandTotalCard(),
                  SizedBox(height: 20),
                ],
              ),
              DailyAppBar(),
            ],
          ),
        );
      },
    );
  }
}
