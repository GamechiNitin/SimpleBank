import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/account_tab/component/account_card_component.dart';
import 'package:simple_bank/view/widget/switch_widget.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  static bool atmAction = false;
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
                    text: "ATM - ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size14,
                        ),
                    children: [
                      TextSpan(
                        text: atmAction ? "Active" : "Paused",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: size14,
                              color: atmAction ? kPrimaryColor : kRedColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SwitchWidget(
                  value: atmAction,
                  onChanged: (onChanged) {
                    setState(() {
                      atmAction = onChanged;
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
                // Text(
                //   autoPaymentAction
                //       ? "Auto Payment (Active)"
                //       : "Auto Payment (Paused)",
                //   textAlign: TextAlign.start,
                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //         fontSize: size14,
                //       ),
                // ),
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
          name: "Active Services",
          colors: [kBlueAccentColor, kLightBlueAccentColor],
          children: const [
            AccountTileWidget(l1: "Mobile Banking", l2: "Active"),
            AccountTileWidget(l1: "SMS Banking", l2: "Active"),
            AccountTileWidget(
              l1: "UPI Banking",
              l2: "Google Pay - Samsung F22\n Phone Pe - Iphone 13 pro max \nPaytm - NothingPhone 1",
            ),
            AccountTileWidget(
              l1: "ATM & Debit Card",
              l2: "Active - 79XX XXXX XXXX XX97",
            ),
            AccountTileWidget(
              l1: "Credit Card",
              l2: "Deactived - 79XX XXXX XXXX XX97",
              div: false,
            ),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Charges",
          colors: [ktealColor, Colors.indigoAccent],
          children: const [
            AccountTileWidget(l1: "Mobile Banking", l2: "300 Rs/M"),
            AccountTileWidget(l1: "SMS Banking", l2: "30 Rs/M"),
            AccountTileWidget(l1: "UPI Banking", l2: "None"),
            AccountTileWidget(l1: "Debit Card", l2: "150 Rs/yr"),
            AccountTileWidget(
              l1: "ATM Card",
              l2: "50 Rs/tran (Free 3 tran/M)",
            ),
            AccountTileWidget(
              l1: "ATM Card Mini Statement",
              l2: "6 Rs/transaction",
            ),
            AccountTileWidget(
              l1: "New cheque book",
              l2: "600 Rs",
            ),
            AccountTileWidget(
              l1: "New Passbook",
              l2: "1000 Rs",
            ),
            AccountTileWidget(
              l1: "Credit Card",
              l2: "200 Rs/yr",
              div: false,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
