import 'package:simple_bank/utils/import.dart';

class WalletTransactionTab extends StatelessWidget {
  const WalletTransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return TransactionCardItemWidget(
          id: "#$index",
          dateTime: "01 June 1996 - 17:05:30",
          status: index.isEven ? "Pending" : "Completed",
          message:
              "A/c * 2721 Debited for Rs. 100 on 03-09-2022 12:02:58 by MobBk reference number 224615586177 Avl Bal Rs:435.83 - Union Bank of India",
          balance: "4661.01",
          lastAmount: "4464.28",
          isCredit: index.isEven,
        );
      },
    );
  }
}
