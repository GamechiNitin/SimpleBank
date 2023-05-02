import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/transactions_tab/component/label_amount_widget.dart';

class TransactionCardItemWidget extends StatelessWidget {
  const TransactionCardItemWidget(
      {super.key,
      required this.id,
      required this.dateTime,
      required this.status,
      required this.message,
      required this.balance,
      required this.lastAmount,
      required this.isCredit});
  final String id;
  final String dateTime;
  final String status;
  final String message;
  final String balance;
  final String lastAmount;
  final bool isCredit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: isCredit ? kDarkGrey2Color : kDarkGreyColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kBorderRadius),
                topRight: Radius.circular(kBorderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  id,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: size10,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      dateTime,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: size10,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                      child: VerticalDivider(
                        color: kWhiteColor,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: size10,
                            color: Colors.lightBlueAccent,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isCredit
                    ? [
                        Colors.teal.withOpacity(0.7),
                        Colors.green.withOpacity(0.7),
                      ]
                    : [
                        Colors.redAccent.withOpacity(0.7),
                        Colors.pinkAccent.shade200.withOpacity(0.7),
                      ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(kBorderRadius),
                bottomRight: Radius.circular(kBorderRadius),
              ),
            ),
            child: Column(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: size10,
                        color: kWhiteColor,
                      ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 4),
                    const Text(
                      "-----------------------------------------",
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelAmountWidget(
                          label: isCredit ? "Credit : " : "Debit : ",
                          amount: lastAmount,
                        ),
                        LabelAmountWidget(
                          label: "Balance : ",
                          amount: balance,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
