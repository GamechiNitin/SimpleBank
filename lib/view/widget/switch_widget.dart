import 'package:simple_bank/utils/import.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key, required this.value, this.onChanged});
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: kPrimaryColor,
      inactiveThumbColor: kWhiteColor,
      inactiveTrackColor: kPinkAccentColor,
      trackOutlineColor: const MaterialStatePropertyAll(kTransparentColor),
      onChanged: onChanged,
    );
  }
}
