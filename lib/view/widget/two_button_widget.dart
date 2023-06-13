import 'package:simple_bank/utils/import.dart';

class TwoButtonWidget extends StatelessWidget {
  const TwoButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.margin,
    required this.text2,
    required this.onTap2,
  });
  final String text;
  final String text2;
  final VoidCallback onTap;
  final VoidCallback onTap2;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ButtonWidget(
            text: text,
            onTap: onTap,
            color: kBlueColor,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: ButtonWidget(
            text: text2,
            onTap: onTap2,
            color: kpurpleAccentColor,
          ),
        ),
      ],
    );
  }
}
