import 'package:fl_chart/fl_chart.dart';
import 'package:simple_bank/utils/import.dart';

class MiniLineChartWidget extends StatelessWidget {
  const MiniLineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      // width: MediaQuery.of(context).size.width,
      height: 40,
      // width: 100,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            drawVerticalLine: false,
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles()),
            bottomTitles: AxisTitles(sideTitles: SideTitles()),
            leftTitles: AxisTitles(sideTitles: SideTitles()),
            rightTitles: AxisTitles(sideTitles: SideTitles()),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          clipData: FlClipData(
            bottom: false,
            left: false,
            right: false,
            top: false,
          ),
          betweenBarsData: [],
          lineBarsData: [
            LineChartBarData(
              belowBarData: BarAreaData(
                show: true,
                // color: kPrimaryColor,
                gradient: LinearGradient(
                  colors: [
                    kBlueColor,
                    kPrimaryColor.withOpacity(0.2),
                    kBlueAccentColor.withOpacity(0.1),
                  ],
                ),
              ),
              dotData: FlDotData(
                show: false,
                checkToShowDot: (spot, barData) {
                  return spot.y != 0;
                },
                getDotPainter: (p0, p1, p2, p3) {
                  return FlDotCirclePainter(
                    color: kBlueAccentColor,
                    radius: 2,
                    strokeColor: kWhiteColor.withOpacity(0.3),
                    strokeWidth: 2,
                  );
                },
              ),
              // lineChartStepData: LineChartStepData(stepDirection: 20),
              isCurved: true,
              color: kWhiteColor,
              gradient: const LinearGradient(
                colors: [
                  kBlueAccentColor,
                  kPrimaryColor,
                  // kErrorColor,
                ],
              ),
              barWidth: 1,
              spots: List.generate(
                12,
                (index) => FlSpot(
                  index.toDouble() + 1,
                  index.isEven
                      ? index * 2000
                      : index >= 8
                          ? index - 1 * -800
                          : index * 5500,
                ),
              ),
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }
}
