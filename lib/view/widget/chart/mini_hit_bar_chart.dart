
import 'package:simple_bank/utils/import.dart';

class MiniHitBarGraph extends StatelessWidget {
  const MiniHitBarGraph(
      {super.key,
      required this.label,
      required this.amount,
      required this.index,
      required this.color});
  final String label;
  final String amount;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 8,
              ),
        ),
        ...List.generate(
          5,
          (i) => Container(
            margin: const EdgeInsets.only(top: 1),
            height: 10,
            width: 10,
            color: index >= i ? color.withOpacity(0.8) : color.withOpacity(0.2),
            // color: index >= i ? color.withOpacity(0.8) : color.withOpacity(0.2),
          ),
        ).reversed,
        const SizedBox(
          height: 2,
        ),
        Text(
          "\$ $amount",
          maxLines: 2,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 7,
                color: kWhiteColor,
              ),
        ),
      ],
    );
  }
}