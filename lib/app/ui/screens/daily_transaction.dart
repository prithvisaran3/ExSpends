import 'package:expense/app/controllers/daily.dart';
import 'package:expense/app/ui/theme/colors.dart';

import 'package:expense/app/ui/widget/common_loading.dart';
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/daily/daily_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../widget/daily/dailyappbar.dart';
import '../widget/daily/grandtotalcard.dart';

class DailyTransactions extends StatefulWidget {
  const DailyTransactions({Key? key}) : super(key: key);

  @override
  State<DailyTransactions> createState() => _DailyTransactionsState();
}

class _DailyTransactionsState extends State<DailyTransactions> {
  late StateMachineController _emptycontroller;

  void _onInit(Artboard art) {
    var ctrl = StateMachineController.fromArtboard(art, 'Juicy')
        as StateMachineController;
    ctrl.isActive = true;
    art.addController(ctrl);

    setState(() {
      _emptycontroller = ctrl;
    });
  }

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
                        const EdgeInsets.only(top: 240, left: 20, right: 20),
                    child: Obx(
                      () => DailyController.to.dailyloading == true
                          ? CommonNormalLoading()
                          : DailyController.to.dailyEmpty == true
                              ? Column(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: (size.width - 40) * 0.8,
                                      child: Container(
                                          child: RiveAnimation.asset(
                                        'assets/rive/NoData.riv',
                                        onInit: _onInit,
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                    CommonText(
                                      text: "NO DATA FOUND",
                                      fontColor: AppColors.white,
                                    ),
                                    SizedBox(height: 40),
                                  ],
                                )
                              : DailyTile(),
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
