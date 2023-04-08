import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/sublabel_component.dart';
import 'package:simple_bank/view/widget/chart/line_chart.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LineChartWidget(),
        const SizedBox(height: 30),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kBlueAccentColor.withOpacity(0.3),
                kBlueAccentColor.withOpacity(0.4),
                // kPrimaryColor.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 85,
                                child: Text(
                                  "Account No.",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              Text(
                                ": 141XXXXXXXX457",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SublaelComponent(
                            l1: "Customer Name",
                            l2: "Nitin Gamechi Arvindbhai",
                          ),
                          const SublaelComponent(
                            l1: "Branch",
                            l2: "Vasad (1452)",
                          ),
                          const SublaelComponent(
                            l1: "IFSC",
                            l2: "SBI0002510",
                          ),
                          const SublaelComponent(
                            l1: "MICR",
                            l2: "562495545",
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            // kBlueAccentColor,
                            // kPrimaryColor,
                            kPrimaryColor,
                            kPrimaryColor.withOpacity(0.5),
                          ],
                        ),
                      ),
                      child: Text(
                        "Saving Account",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: size12,
                              fontWeight: FontWeight.w500,
                              color: kWhiteColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Balance : \$12012",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
