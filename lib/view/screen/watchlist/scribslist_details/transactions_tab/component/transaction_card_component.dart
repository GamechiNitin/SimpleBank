import 'package:simple_bank/utils/import.dart';

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
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return Container(
          decoration: state.isDarkMode
              ? CustomDecoration.cardDarkDeocoration
              : CustomDecoration.cardLightDeocoration,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
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
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: size10,
                              ),
                        ),
                        SizedBox(
                          height: 10,
                          child: VerticalDivider(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          status,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
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
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 16,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isCredit
                        ? [kLightTealColor, kLightGreenColor]
                        : [kRedAccentColor, kPinkAccentColor],
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: size10,
                          ),
                    ),
                    Text(
                      "-----------------------------------------",
                      maxLines: 1,
                      style: TextStyle(color: kLightWhiteColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelAmountWidget(
                          label: isCredit ? "Credited : " : "Debited : ",
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
              ),
            ],
          ),
        );
      },
    );
  }
}
