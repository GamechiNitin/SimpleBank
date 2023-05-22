import 'package:simple_bank/utils/import.dart';

class AccountCardComponent extends StatelessWidget {
  const AccountCardComponent(
      {super.key,
      required this.name,
      this.date,
      required this.children,
      required this.colors,
      this.dateLabel});
  final String name;
  final String? dateLabel;
  final String? date;
  final List<Widget> children;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: state.isDarkMode
              ? CustomDecoration.cardDarkDeocoration
              : CustomDecoration.cardLightDeocoration,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius),
                    topRight: Radius.circular(kBorderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: size10,
                            color: kWhiteColor,
                          ),
                    ),
                    if (date != null && date != "")
                      Row(
                        children: [
                          Text(
                            date!,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: size10,
                                  color: kWhiteColor,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                            child: VerticalDivider(
                              color: kWhiteColor,
                              thickness: 2,
                            ),
                          ),
                          Text(
                            dateLabel ?? "Last Updated",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: size10,
                                  color: kWhiteColor,
                                ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.shadow,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(kBorderRadius),
                    bottomRight: Radius.circular(kBorderRadius),
                  ),
                ),
                child: Column(
                  children: children,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
