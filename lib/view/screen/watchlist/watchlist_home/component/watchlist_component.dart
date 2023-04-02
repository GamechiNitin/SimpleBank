import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/widget/chart/mini_line_chart.dart';

class WatchlistComponent extends StatelessWidget {
  const WatchlistComponent({
    super.key,
    this.shortName,
    this.fullName,
    this.balance,
    this.lastTransaction,
    this.percentage,
    this.isSelected,
    this.imageUrl,
    this.onTap,
  });

  final String? shortName;
  final String? fullName;
  final String? balance;
  final String? lastTransaction;
  final String? percentage;
  final String? imageUrl;
  final bool? isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor,
              width: 0.1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kHintColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imageUrl!,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (shortName != null && shortName != "")
                    Text(
                      shortName!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: size14,
                            color: isSelected == true ? kBlueAccentColor : null,
                          ),
                    ),
                  const SizedBox(
                    height: 2,
                  ),
                  if (fullName != null && fullName != "")
                    Text(
                      fullName!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: size8,
                            color: Theme.of(context).disabledColor,
                          ),
                    ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 60,
              height: 30,
              child: const MiniLineChartWidget(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (balance != null && balance != "")
                    Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 2,
                        bottom: 2,
                        left: 2,
                        right: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSquareBorderRadius),
                        color: kBlueAccentColor,
                      ),
                      child: Text(
                        balance!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: size12,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (lastTransaction != null && lastTransaction != "")
                        Text(
                          "+ $lastTransaction",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: size10,
                                color: kPrimaryColor,
                              ),
                        ),
                      const SizedBox(width: 4),
                      Text(
                        "+($percentage%)",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: size10,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
