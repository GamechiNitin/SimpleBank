import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/sublabel_component.dart';
import 'package:simple_bank/view/widget/chart/mini_hit_bar_chart.dart';

class ChartTabComponent extends StatelessWidget {
  const ChartTabComponent({
    super.key,
    required this.accountNumber,
    required this.customerName,
    required this.branch,
    required this.ifsc,
    required this.micr,
    required this.currentBalance,
    required this.accountType,
    required this.lowAmount,
    required this.averageAmount,
    required this.highAmount,
    required this.color,
    this.applyBorder,
  });
  final String accountNumber;
  final String accountType;
  final String customerName;
  final String branch;
  final String ifsc;
  final String micr;
  final String currentBalance;
  final String lowAmount;
  final String averageAmount;
  final String highAmount;
  final Color color;
  final bool? applyBorder;

  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      color: color,
      applyBorder: applyBorder,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 71,
                          child: Text(
                            "Account No",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Text(
                          ": $accountNumber",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SublaelComponent(
                      l1: "Customer Name",
                      l2: customerName,
                      // color: kWhiteColor,
                    ),
                    SublaelComponent(
                      l1: "Branch",
                      l2: branch,
                    ),
                    SublaelComponent(
                      l1: "IFSC",
                      l2: ifsc,
                    ),
                    SublaelComponent(
                      l1: "MICR",
                      l2: micr,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Balance :",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "\$ $currentBalance",
                      maxLines: 2,
                      style: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.copyWith(
                            fontSize: 17,
                            color: kErrorColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                margin: const EdgeInsets.only(left: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kPrimaryColor,
                      kPrimaryColor.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Text(
                  accountType,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: size12,
                        fontWeight: FontWeight.w500,
                        color: kWhiteColor,
                      ),
                ),
              ),
              Row(
                children: [
                  MiniHitBarGraph(
                    color: kErrorColor,
                    label: "Low",
                    index: 0,
                    amount: lowAmount,
                  ),
                  const SizedBox(width: 8),
                  MiniHitBarGraph(
                    color: kBlueColor,
                    label: "Average",
                    index: 2,
                    amount: averageAmount,
                  ),
                  const SizedBox(width: 8),
                  MiniHitBarGraph(
                    color: kPrimaryColor,
                    label: "High",
                    index: 3,
                    amount: highAmount,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
