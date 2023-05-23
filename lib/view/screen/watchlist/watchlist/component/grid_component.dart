import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/widget/chart/mini_line_chart.dart';

class GridComponent extends StatelessWidget {
  const GridComponent(
      {super.key,
      this.shortName,
      this.fullName,
      this.balance,
      this.lastTransaction,
      this.isSelected = false,
      this.percentage,
      this.onTap});
  final String? shortName;
  final String? fullName;
  final String? balance;
  final String? lastTransaction;
  final String? percentage;
  final bool? isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: isSelected == true
                ? kBlueAccentColor
                : Theme.of(context).disabledColor,
            width: kBorderWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (shortName != null && shortName != "")
              Text(
                shortName!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected == true ? kBlueAccentColor : null,
                      fontSize: size10,
                    ),
              ),
            if (fullName != null && fullName != "")
              Text(
                fullName ?? "",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size8,
                      color: Theme.of(context).disabledColor,
                    ),
              ),
            const MiniLineChartWidget(),
            if (balance != null && balance != "")
              Text(
                balance ?? "",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: size12,
                    ),
              ),
            Row(
              children: [
                if (lastTransaction != null && lastTransaction != "")
                  Text(
                    lastTransaction ?? "",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size10,
                          color: kPrimaryColor,
                        ),
                  ),
                const SizedBox(width: 2),
                Text(
                  "(+$percentage%)",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: size10,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
