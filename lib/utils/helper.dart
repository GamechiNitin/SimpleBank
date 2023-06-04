import 'package:simple_bank/utils/import.dart';

class Helper {
  static void toast(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          margin: const EdgeInsets.all(20),
          backgroundColor: kBlueAccentColor,
          closeIconColor: kWhiteColor,
          content: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: kWhiteColor),
          ),
        ),
      );
}
