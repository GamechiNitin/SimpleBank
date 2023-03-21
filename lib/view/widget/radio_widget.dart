import 'package:simple_bank/utils/import.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.type});
  final String title;
  final String subTitle;
  final String type;
  final int value;
  final int? groupValue;
  final Function(dynamic val) onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Theme.of(context).unselectedWidgetColor,
      ),
      child: RadioListTile(
        dense: true,
        // controlAffinity:
        //     ListTileControlAffinity
        //         .trailing,
        activeColor: kPrimaryColor,
        contentPadding: EdgeInsets.zero,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
       
        // },
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: size12),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(subTitle, style: Theme.of(context).textTheme.labelSmall),
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
              type,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
