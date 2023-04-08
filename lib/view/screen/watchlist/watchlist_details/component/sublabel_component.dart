import 'package:simple_bank/utils/import.dart';

class SublaelComponent extends StatelessWidget {
  const SublaelComponent({super.key, this.l1, this.l2, this.color});
  final String? l1;
  final String? l2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 85,
          child: Text(
            l1 ?? "",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                ),
          ),
        ),
        Text(
          ": $l2",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 8,
                color: color,
              ),
        ),
      ],
    );
  }
}
