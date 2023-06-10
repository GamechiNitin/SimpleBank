import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/widget/chart/mini_line_chart.dart';

class WalletCardComponent extends StatelessWidget {
  const WalletCardComponent({
    super.key,
    this.colors,
    required this.name,
    required this.balance,
    required this.id,
    required this.walletType,
    this.onTap,
  });
  final List<Color>? colors;

  final String name;
  final String walletType;
  final String balance;
  final String id;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(10),
            height: 190,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: state.isDarkMode ? kBlackColor : kWhiteColor,
              borderRadius: BorderRadius.circular(10),
              gradient: colors == null ? null : LinearGradient(colors: colors!),
              boxShadow: [
                BoxShadow(
                  color:
                      state.isDarkMode ? Colors.black12 : Colors.grey.shade300,
                  offset: const Offset(5, 5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color:
                      state.isDarkMode ? Colors.black12 : Colors.grey.shade400,
                  offset: const Offset(-5, -5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      walletType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: size22,
                            fontWeight: FontWeight.w600,
                            color: colors == null
                                ? Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color
                                : kWhiteColor,
                          ),
                    ),
                    RotatedBox(
                      quarterTurns: 9,
                      child: Icon(
                        Icons.wifi,
                        color: colors == null
                            ? Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.color
                            : kWhiteColor,
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: MiniLineChartWidget(
                        height: 75,
                        colors: colors,
                        width: 2.5,
                        linecolors: colors == null
                            ? null
                            : [
                                kWhiteColor.withOpacity(0.3),
                                kWhiteColor.withOpacity(0.6),
                              ],
                      ),
                    ),
                    Text(
                      "\$ $balance",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: size16,
                            fontWeight: FontWeight.w600,
                            color: colors != null ? kWhiteColor : kPrimaryColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: size16,
                            color: colors == null
                                ? Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color
                                    ?.withOpacity(0.8)
                                : kWhiteColor.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: size12,
                            fontWeight: FontWeight.w600,
                            color: colors == null
                                ? Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color
                                    ?.withOpacity(0.9)
                                : kWhiteColor.withOpacity(0.9),
                            letterSpacing: 0.8,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
