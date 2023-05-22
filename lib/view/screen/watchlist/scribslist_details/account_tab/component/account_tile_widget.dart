import 'package:simple_bank/utils/import.dart';

class AccountTileWidget extends StatelessWidget {
  const AccountTileWidget(
      {super.key, required this.l1, required this.l2, this.div});
  final String l1;
  final String l2;
  final bool? div;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l1,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: size10,
                  ),
            ),
            Flexible(
              child: Text(
                l2,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 9,
                    ),
              ),
            ),
          ],
        ),
        if (!(div == false))
          Divider(
            thickness: 0.4,
            color: Theme.of(context).disabledColor,
          )
        else
          const SizedBox(height: 8),
      ],
    );
  }
}
