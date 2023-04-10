import 'package:simple_bank/utils/import.dart';

class RecentActivityComponent extends StatelessWidget {
  const RecentActivityComponent(
      {super.key,
      required this.date,
      required this.activity,
      required this.color,
      this.applyBorder,
      required this.hitColor});
  final List<String> date;
  final List<String> activity;
  final Color color;
  final List<Color> hitColor;
  final bool? applyBorder;
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
        height: 160,
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
              blurRadius: 20,
              spreadRadius: 0,
              color: color.withAlpha(120),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Activity",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8,
            ),
            ...List.generate(
              activity.length,
              (index) => Padding(
                padding: EdgeInsets.only(top: index != 0 ? 3 : 0),
                child: RecentActivityItemView(
                  date: date[index],
                  activity: activity[index],
                  hitColor: hitColor[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentActivityItemView extends StatelessWidget {
  const RecentActivityItemView(
      {super.key,
      required this.hitColor,
      required this.activity,
      required this.date});
  final Color hitColor;
  final String activity;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 10,
          width: 10,
          color: hitColor.withOpacity(0.7),
          margin: const EdgeInsets.only(right: 8),
        ),
        Expanded(
          child: Text(
            activity,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: size10,
                ),
          ),
        ),
        SizedBox(
          height: 10,
          child: VerticalDivider(
            color: hitColor.withOpacity(0.7),
            thickness: 2,
          ),
        ),
        SizedBox(
          width: 70,
          height: 15,
          child: Text(
            date,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: size10,
                ),
          ),
        ),
      ],
    );
  }
}
