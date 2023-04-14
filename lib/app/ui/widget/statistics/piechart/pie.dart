
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/colors.dart';


class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(

            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(9, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 16.0 : 12.0;
      final radius = isTouched ? 135.0 : 110.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.category1,
            value: 10,
            title: '1',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/ophthalmology-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.category2,
            value: 10,
            title: '2',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/librarian-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.category3,
            value: 10,
            title: '3',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.category4,
            value: 10,
            title: '4',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 4:
          return PieChartSectionData(
            color: AppColors.category5,
            value: 10,
            title: '5',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 5:
          return PieChartSectionData(
            color: AppColors.category6,
            value: 10,
            title: '6',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 6:
          return PieChartSectionData(
            color: AppColors.category7,
            value: 10,
            title: '7',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 7:
          return PieChartSectionData(
            color: AppColors.category8,
            value: 10,
            title: '8',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 8:
          return PieChartSectionData(
            color: AppColors.category9,
            value: 20,
            title: '9',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.black,
            // ),
            // badgePositionPercentageOffset: .98,
          );


        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
      this.svgAsset, {
        required this.size,
        required this.borderColor,
      });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}