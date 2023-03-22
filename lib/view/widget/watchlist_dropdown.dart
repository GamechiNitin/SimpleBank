import 'package:simple_bank/utils/import.dart';

class WatchListDropdownWidget extends StatelessWidget {
  const WatchListDropdownWidget(
      {super.key,
      required this.watchListName,
      required this.scribsNumber,
      required this.watchListType,
      this.onTap});
  final String watchListName;
  final String scribsNumber;
  final String watchListType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchListName,
                  style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                        fontSize: 12,
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      scribsNumber,
                      // "10 scribs",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      watchListType,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              // size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
