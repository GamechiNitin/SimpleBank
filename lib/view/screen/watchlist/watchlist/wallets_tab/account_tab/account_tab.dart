import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/account_tab/component/account_card_component.dart';
import 'package:simple_bank/view/widget/switch_widget.dart';

class WalletAccountTab extends StatefulWidget {
  const WalletAccountTab({super.key});

  @override
  State<WalletAccountTab> createState() => _WalletAccountTabState();
}

class _WalletAccountTabState extends State<WalletAccountTab> {
  static bool contactlessPayment = false;
  static bool autoPaymentAction = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Quick Services",
          colors: [kpurpleAccentColor, kdeepPurpleAccentColor],
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Contactless Payment - ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size14,
                        ),
                    children: [
                      TextSpan(
                        text: contactlessPayment ? "Active" : "Paused",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: size14,
                              color: contactlessPayment
                                  ? kPrimaryColor
                                  : kRedColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SwitchWidget(
                  value: contactlessPayment,
                  onChanged: (onChanged) {
                    setState(() {
                      contactlessPayment = onChanged;
                    });
                  },
                ),
              ],
            ),
            Divider(
              thickness: 0.4,
              color: Theme.of(context).disabledColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Auto Payment - ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size14,
                        ),
                    children: [
                      TextSpan(
                        text: autoPaymentAction ? "Active" : "Paused",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: size14,
                              color:
                                  autoPaymentAction ? kPrimaryColor : kRedColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SwitchWidget(
                  value: autoPaymentAction,
                  onChanged: (onChanged) {
                    setState(() {
                      autoPaymentAction = onChanged;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Account Information",
          date: "01 June 1996 - 17:05:30",
          colors: [kBlueAccentColor, kLightBlueAccentColor],
          children: const [
            AccountTileWidget(l1: "Account No.", l2: "57942357954"),
            AccountTileWidget(l1: "Account Type", l2: "Regular Saving Account"),
            AccountTileWidget(l1: "Customer Id", l2: "45846578"),
            AccountTileWidget(l1: "MICR", l2: "8787555"),
            AccountTileWidget(l1: "IFSC", l2: "SBI000555"),
            AccountTileWidget(l1: "Minimun Balance", l2: "2000"),
            AccountTileWidget(l1: "Minor", l2: "No"),
            AccountTileWidget(
                l1: "A/C open date", l2: "14/09/2016", div: false),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Headquater",
          date: "01 June 1996 - 17:05:30",
          colors: [kPinkAccentColor, kRedAccentColor, kPinkAccentColor],
          children: const [
            AccountTileWidget(l1: "Chairman", l2: "Virat Patel"),
            AccountTileWidget(l1: "Website", l2: "https://sbi.com"),
            AccountTileWidget(l1: "Email", l2: "contact@sbi.com"),
            AccountTileWidget(l1: "Headquater", l2: "Mumbai"),
            AccountTileWidget(l1: "Zone office", l2: "8568"),
            AccountTileWidget(l1: "Head office", l2: "24"),
            AccountTileWidget(l1: "Helpline", l2: "1800 5445 4751"),
            AccountTileWidget(
                l1: "Address",
                l2: "Jio garden, Gatokopar West Mumbai",
                div: false),
          ],
        ),
      ],
    );
  }
}
