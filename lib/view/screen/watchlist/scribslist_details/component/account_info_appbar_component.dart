import 'package:simple_bank/utils/import.dart';

class AccountInfoAppBarComponent extends StatelessWidget {
  const AccountInfoAppBarComponent(
      {super.key, this.balance, this.lastAmount, this.percentage});
  final String? balance;
  final String? lastAmount;
  final String? percentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            balance ?? "\$ 2,00,020.00",
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 20,
                  color: kErrorColor,
                ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lastAmount ?? "+ 1204",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                percentage ?? "10%",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
