import 'package:simple_bank/utils/import.dart';

class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget(
      {super.key,
      this.applyBorder,
      required this.color,
      required this.child,
      this.height});
  final bool? applyBorder;
  final Color color;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: applyBorder != null
          ? BorderRadius.circular(kBorderRadius)
          : BorderRadius.zero,
      child: Container(
        margin: applyBorder == true
            ? const EdgeInsets.symmetric(horizontal: 10)
            : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        height: height ?? 160,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:
              applyBorder == true ? BorderRadius.circular(kBorderRadius) : null,
          color: color.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .color!
                .withOpacity(0.4),
            width: 0.9,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: color.withAlpha(120),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
