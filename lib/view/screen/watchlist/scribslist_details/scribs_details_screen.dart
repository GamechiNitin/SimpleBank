import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/account_tab/account_tab.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/component/account_info_appbar_component.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/charts_tab/chart_tab.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/transactions_tab/transactions_tab.dart';
import 'package:simple_bank/view/widget/persistent_header.dart';
import 'package:simple_bank/view/widget/persistent_tabbar.dart';
import 'services_tab/services_tab.dart';

class ScribsListDetailScreen extends StatefulWidget {
  const ScribsListDetailScreen(
      {super.key, required this.scribsListModel, required this.scribsList});
  final ScribsListModel scribsListModel;
  final List<ScribsListModel> scribsList;

  @override
  State<ScribsListDetailScreen> createState() => _ScribsListDetailScreenState();
}

class _ScribsListDetailScreenState extends State<ScribsListDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  var currentIndex = 0;
  bool isGridView = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
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
              actions: [
                Container(
                  height: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  margin: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        // kBlueAccentColor,
                        // kPrimaryColor,
                        kErrorColor,
                        kErrorColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Text(
                    "FREEZED ACCOUNT",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: size12,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor,
                        ),
                  ),
                ),
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.scribsListModel.bankName ?? "",
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: 12,
                            ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.scribsListModel.shortBankName ?? "",
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
                        widget.scribsListModel.type ?? "",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: AccountInfoAppBarComponent()),
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentHeader(
                child: PersistentTabBar(
                  controller: controller,
                  tabs: const [
                    Text("Quick"),
                    Text("Transaction"),
                    Text("Services"),
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
            ChartTab(),
            TransactionTab(),
            ServicesTab(),
            AccountTab(),
          ],
        ),
      ),
    );
  }
}
