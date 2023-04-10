import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_bank/utils/colors.dart';
import 'package:simple_bank/utils/dimens.dart';

class PieChartComponent extends StatelessWidget {
  const PieChartComponent({super.key, required this.color, this.applyBorder});
  final Color color;
  final bool? applyBorder;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: applyBorder != null
          ? BorderRadius.circular(kBorderRadius)
          : BorderRadius.zero,
      child: Container(
        margin: applyBorder == true
            ? const EdgeInsets.symmetric(horizontal: 10)
            : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:
              applyBorder == true ? BorderRadius.circular(kBorderRadius) : null,
          color: color.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .color!
                .withOpacity(0.4),
            width: 0.9,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 0,
              color: color.withAlpha(120),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  HitPieChart(
                    color: kPrimaryColor,
                    label: "Invested Amount",
                  ),
                  SizedBox(height: 4),
                  HitPieChart(
                    color: kBlueAccentColor,
                    label: "PF",
                  ),
                  SizedBox(height: 4),
                  HitPieChart(
                    color: kLightPrimaryColor,
                    label: "Fixed Deposit",
                  ),
                  SizedBox(height: 4),
                  HitPieChart(
                    color: Colors.deepPurple,
                    label: "Interent Gained",
                  ),
                  SizedBox(height: 4),
                  HitPieChart(
                    color: Colors.tealAccent,
                    label: "Profit",
                  ),
                ],
              ),
            ),
            Expanded(
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 30,
                  sectionsSpace: 0,
                  pieTouchData: PieTouchData(),
                  // startDegreeOffset: 180,
                  sections: [
                    PieChartSectionData(
                      color: kPrimaryColor.withOpacity(0.7),
                      title: "12 %",
                      value: 12,
                      radius: 35,
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: size10,
                              ),
                    ),
                    PieChartSectionData(
                      color: kBlueColor.withOpacity(0.7),
                      title: "30 %",
                      value: 30,
                      radius: 35,
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: size10,
                              ),
                    ),
                    PieChartSectionData(
                      color: kErrorColor.withOpacity(0.7),
                      title: "13 %",
                      value: 13,
                      radius: 35,
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: size10,
                              ),
                    ),
                    PieChartSectionData(
                      color: Colors.deepPurple.withOpacity(0.4),
                      title: "35 %",
                      value: 35,
                      radius: 35,
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: size10,
                              ),
                    ),
                    PieChartSectionData(
                      color: Colors.tealAccent,
                      title: "10 %",
                      value: 10,
                      radius: 35,
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: size10,
                              ),
                    ),
                  ],
                ),
                swapAnimationDuration: const Duration(seconds: 3),
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HitPieChart extends StatelessWidget {
  const HitPieChart({super.key, required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 10,
          width: 10,
          color: color.withOpacity(0.7),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: size12,
                // fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
