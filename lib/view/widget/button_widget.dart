import 'package:simple_bank/utils/import.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.margin,
    this.color,
  });
  final String text;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        margin: margin ?? const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kWhiteColor, fontSize: size18),
        ),
      ),
    );
  }
}
