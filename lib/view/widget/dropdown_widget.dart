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
      height: 45,
      padding: const EdgeInsets.only(right: 8, left: 16, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSquareBorderRadius),
        border: Border.all(
          color: kPLColor,
          width: kCardBorderWidth,
        ),
      ),
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
    );
  }
}
