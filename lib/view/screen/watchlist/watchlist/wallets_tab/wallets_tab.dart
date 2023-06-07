import 'package:simple_bank/utils/enum.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/wallets_tab/component/wallet_component.dart';

class WalletsTab extends StatelessWidget {
  const WalletsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 90,
          ),
          children: [
            WalletCardComponent(
              walletType: WalletsEnum.digitalMoney.formatedName,
              name: "Nitin Gamechi",
              balance: "5000.00",
              id: "145236468469",
            ),
            WalletCardComponent(
              colors: WalletsEnum.paypal.color,
              walletType: WalletsEnum.paypal.formatedName,
              name: "Nitin Gamechi",
              balance: "5000.00",
              id: "145236468469",
            ),
            WalletCardComponent(
              walletType: WalletsEnum.amazon.formatedName,
              name: "Nitin Gamechi",
              balance: "5000.00",
              id: "145236468469",
              colors: WalletsEnum.amazon.color,
            ),
            WalletCardComponent(
              walletType: WalletsEnum.phonePe.formatedName,
              name: "Nitin Gamechi",
              balance: "5,96,300.00",
              id: "145236468469",
              colors: WalletsEnum.phonePe.color,
            ),
            WalletCardComponent(
              walletType: WalletsEnum.cred.formatedName,
              name: "Nitin Gamechi",
              balance: "5,96,300.00",
              id: "145236468469",
              colors: WalletsEnum.cred.color,
            ),
            WalletCardComponent(
              walletType: WalletsEnum.paytm.formatedName,
              name: "Nitin Gamechi",
              balance: "5,96,300.00",
              id: "145236468469",
              colors: WalletsEnum.paytm.color,
            ),
          ],
        );
      },
    );
  }
}
