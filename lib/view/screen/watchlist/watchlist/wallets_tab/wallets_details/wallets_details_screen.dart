import 'package:simple_bank/data/model/wallets_model.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/component/account_info_appbar_component.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/wallets_tab/account_tab/account_tab.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/wallets_tab/quick_tab/quick_tab.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/wallets_tab/transaction_tab/transactions_tab.dart';
import 'package:simple_bank/view/widget/persistent_header.dart';
import 'package:simple_bank/view/widget/persistent_tabbar.dart';

class WalletsDetailScreen extends StatefulWidget {
  const WalletsDetailScreen({super.key, required this.walletModel});
  final WalletModel walletModel;

  @override
  State<WalletsDetailScreen> createState() => _WalletsDetailScreenState();
}

class _WalletsDetailScreenState extends State<WalletsDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  var currentIndex = 0;
  bool isGridView = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
    controller?.addListener(() {
      currentIndex = controller!.index;
      _notify();
    });
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBlackColor,
      body: NestedScrollView(
        // physics: const BouncingScrollPhysics(),
        controller: scrollController,
        headerSliverBuilder: (context, val) {
          return [
            SliverAppBar(
              surfaceTintColor: kTransparentColor,
              pinned: true,
              expandedHeight: kToolbarHeight,
              titleSpacing: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.walletModel.walletType ?? "",
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: 12,
                            ),
                  ),
                  Text(
                    widget.walletModel.bank?.accountType ?? "Wallets",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              actions: [
                Container(
                  height: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  margin: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        kBlueAccentColor,
                        kPrimaryColor,
                        // kErrorColor,
                        // kErrorColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Text(
                    "ACTIVE",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: size12,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor,
                        ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: AccountInfoAppBarComponent(
                balance: "\$ ${widget.walletModel.balance}",
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentHeader(
                child: PersistentTabBar(
                  controller: controller,
                  tabs: const [
                    Text("Quick"),
                    Text("Transaction"),
                    Text("Account"),
                  ],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller,
          children: const [
            WalletQuickTab(),
            WalletTransactionTab(),
            WalletAccountTab(),
          ],
        ),
      ),
    );
  }
}
