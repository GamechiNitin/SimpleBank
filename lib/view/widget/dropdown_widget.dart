import 'package:simple_bank/utils/import.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {super.key, this.onChanged, this.items, this.value, this.icon});
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final Object? value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSquareBorderRadius),
        border: Border.all(
          color: kLPrimaryColor,
          width: kCardBorderWidth,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 45,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: kPLColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: kWhiteColor,
            ),
          ),
          Flexible(
            child: DropdownButton(
              isExpanded: true,
              isDense: true,
              value: value,
              underline: const SizedBox(),
              iconEnabledColor:
                  Theme.of(context).inputDecorationTheme.hintStyle?.color,
              hint: Text(
                "Select Categorires",
                style: Theme.of(context).inputDecorationTheme.hintStyle,
              ),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
