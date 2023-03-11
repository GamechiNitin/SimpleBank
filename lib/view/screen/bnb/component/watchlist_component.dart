import 'package:simple_bank/utils/import.dart';

class WatchlistComponent extends StatelessWidget {
  const WatchlistComponent({
    super.key,
    required this.shortName,
    required this.bankName,
    required this.type,
  });
  final String shortName;
  final String bankName;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(14),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Text(
              shortName.substring(0, 1),
              style: const TextStyle(
                fontSize: size18,
                color: kBlackColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$type : ",
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: size12,
                              color: type == "Bank"
                                  ? kPrimaryColor
                                  : type != "ALL"
                                      ? kBlueColor
                                      : kLightPrimaryColor,
                            ),
                  ),
                  Text(
                    shortName,
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: size12,
                            ),
                  ),
                ],
              ),
              Text(
                bankName,
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      fontSize: size10,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
