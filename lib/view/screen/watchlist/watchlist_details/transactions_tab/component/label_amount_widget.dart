
import 'package:simple_bank/utils/import.dart';

class LabelAmountWidget extends StatelessWidget {
  const LabelAmountWidget(
      {super.key, required this.label, required this.amount});
  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: size10,
                color: kWhiteColor,
              ),
        ),
        const Icon(
          Icons.currency_bitcoin,
          color: Colors.yellow,
          size: 20,
        ),
        Text(
          amount,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: size12,
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}