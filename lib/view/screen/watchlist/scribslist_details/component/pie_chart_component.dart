import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_bank/utils/colors.dart';
import 'package:simple_bank/utils/dimens.dart';
import 'package:simple_bank/view/widget/border_container_widget.dart';

class PieChartComponent extends StatelessWidget {
  const PieChartComponent({super.key, required this.color, this.applyBorder});
  final Color color;
  final bool? applyBorder;
  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      color: color,
      applyBorder: applyBorder,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Investment Portfolio",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                const HitPieChart(
                  color: kPrimaryColor,
                  label: "Invested Amount",
                ),
                const SizedBox(height: 4),
                const HitPieChart(
                  color: kBlueAccentColor,
                  label: "PF",
                ),
                const SizedBox(height: 4),
                const HitPieChart(
                  color: kLightPrimaryColor,
                  label: "Fixed Deposit",
                ),
                const SizedBox(height: 4),
                const HitPieChart(
                  color: Colors.deepPurple,
                  label: "Interent Gained",
                ),
                const SizedBox(height: 4),
                const HitPieChart(
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
                    color: kPinkAccentColor,
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
          const SizedBox(width: 16),
        ],
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
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: size10,
                // fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
