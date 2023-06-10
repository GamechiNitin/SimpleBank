import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/model/wallets_model.dart';
import 'package:simple_bank/utils/enum.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/wallets_tab/component/wallet_component.dart';

class WalletsTab extends StatelessWidget {
  const WalletsTab({super.key});

  @override
  Widget build(BuildContext context) {
    if (watchList.isNotEmpty &&
        watchList.elementAt(0).walletModel != null &&
        watchList.elementAt(0).walletModel!.isNotEmpty) {
      List<WalletModel> walletModel = watchList.elementAt(0).walletModel!;
      return ListView.builder(
        itemCount: walletModel.length,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 90,
        ),
        itemBuilder: (context, index) {
          return WalletCardComponent(
              colors: walletModel[index].walletType?.color,
              walletType: walletModel[index].walletType ?? "",
              name: walletModel[index].userName ?? "",
              balance: walletModel[index].balance ?? "",
              id: "${walletModel[index].id}".addSpace
              // id: walletModel[index].id.toString().replaceAllMapped(
              //     RegExp(r".{5}"), (match) => "${match.group(0)}"),
              );
        },
      );
    } else {
      return Container();
    }
  }
}
