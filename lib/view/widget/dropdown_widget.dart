import 'package:simple_bank/utils/import.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {super.key,
      this.onChanged,
      this.items,
      this.value,
      this.icon,
      this.hint});
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final Object? value;
  final IconData? icon;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSquareBorderRadius),
        border: Border.all(
          color: kPrimaryColor,
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
              color: kPrimaryColor.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kSquareBorderRadius - 1.5),
                bottomLeft: Radius.circular(kSquareBorderRadius - 1.5),
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
                hint ?? "",
                maxLines: 1,
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
