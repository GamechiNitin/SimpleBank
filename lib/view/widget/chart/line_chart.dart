import 'package:fl_chart/fl_chart.dart';
import 'package:simple_bank/utils/import.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(right: 10, left: 10),
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            drawVerticalLine: false,
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(),
            ),
            bottomTitles: AxisTitles(
              drawBehindEverything: false,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 26,
                getTitlesWidget: (value, meta) {
                  Widget text(String val) => Container(
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              kBlueAccentColor,
                              kPrimaryColor,
                            ],
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          val,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: size10,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                  ),
                        ),
                      );
                  switch (value.toInt()) {
                    case 3:
                      return text("MAR");
                    case 6:
                      return text("JUNE");
                    case 9:
                      return text("SEP");
                    case 12:
                      return Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: text("DEC"),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 25,
                interval: 7000,
                getTitlesWidget: (value, meta) {
                  Widget text(String val) => Text(
                        val,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                      );
                  return text(meta.formattedValue);
                },
              ),
              drawBehindEverything: true,
            ),
          ),

          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).textTheme.labelSmall!.color!,
                width: 0.4,
              ),
              left: BorderSide(
                color: Theme.of(context).textTheme.labelSmall!.color!,
                width: 0.4,
              ),
            ),
          ),
          clipData: FlClipData(
            bottom: false,
            left: false,
            right: false,
            top: false,
          ),
          // read about it in the LineChartData section
          // baselineX: 2,
          betweenBarsData: [
            // BetweenBarsData(
            //   fromIndex: 0,
            //   toIndex: 11,
            //   color: kErrorColor,
            // ),
          ],
          // maxX: 2,

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
                    radius: 4,
                    strokeColor: kWhiteColor.withOpacity(0.3),
                    strokeWidth: 5,
                  );
                },
              ),
              // lineChartStepData: LineChartStepData(stepDirection: 20),
              isCurved: true,
              color: kWhiteColor,
              gradient: const LinearGradient(
                colors: [
                  // kWhiteColor,
                  kBlueAccentColor,
                  kPrimaryColor,
                  // kErrorColor,
                ],
              ),
              barWidth: 3,
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
