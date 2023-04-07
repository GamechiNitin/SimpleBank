import 'dart:developer';

import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/account_info_appbar_component.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_home/component/grid_component.dart';
import 'package:simple_bank/view/widget/chart/line_chart.dart';
import 'package:simple_bank/view/widget/persistent_header.dart';
import 'package:simple_bank/view/widget/persistent_tabbar.dart';

class WatchListDetailScreen extends StatefulWidget {
  const WatchListDetailScreen(
      {super.key, required this.watchListModel, required this.watchList});
  final WatchlistModel watchListModel;
  final List<WatchlistModel> watchList;

  @override
  State<WatchListDetailScreen> createState() => _WatchListDetailScreenState();
}

class _WatchListDetailScreenState extends State<WatchListDetailScreen>
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
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, val) {
          log(val.toString());
          return [
            SliverAppBar(
              surfaceTintColor: kTransparentColor,
              pinned: true,
              expandedHeight: kToolbarHeight,
              titleSpacing: 0,
              actions: [
                Container(
                  height: 25,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  margin: EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        // kBlueAccentColor,
                        // kPrimaryColor,
                        kPrimaryColor,
                        kPrimaryColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Text(
                    "Saving Account",
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
                    widget.watchListModel.bankName ?? "",
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: 12,
                            ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.watchListModel.shortBankName ?? "",
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
                        widget.watchListModel.type ?? "",
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
                    Text("Chart"),
                    Text("Transaction"),
                    Text("Analysis"),
                    Text("Account"),
                  ],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller,
          children: [
            ListView(
              // shrinkWrap: true,
              children: [
                const LineChartWidget(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).disabledColor,
                        width: 0.1,
                      ),
                      bottom: BorderSide(
                        color: Theme.of(context).disabledColor,
                        width: 0.1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Watch",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: size14,
                                  ),
                          children: [
                            TextSpan(
                              text: "List",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: size14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isGridView = !isGridView;
                          _notify();
                        },
                        child: Container(
                          color: kTransparentColor,
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            isGridView
                                ? Icons.grid_view
                                : Icons.format_list_bulleted_rounded,
                            color: Theme.of(context).hintColor,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (isGridView)
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.watchList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GridComponent(
                        isSelected: index == 0,
                        shortName: widget.watchList[index].shortBankName,
                        fullName: widget.watchList[index].bankName,
                        balance: widget.watchList[index].balance,
                        lastTransaction: widget.watchList[index].lastAmount,
                        percentage: widget.watchList[index].percenttage,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WatchListDetailScreen(
                                watchListModel: widget.watchList[index],
                                watchList: widget.watchList,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                else
                  ListView.builder(
                    itemCount: widget.watchList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: 4,
                      right: 16,
                      bottom: 20,
                      left: 16,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return WatchlistComponent(
                        isSelected: index == 0,
                        imageUrl: "https://picsum.photos/200",
                        shortName: widget.watchList[index].shortBankName,
                        fullName: widget.watchList[index].bankName,
                        balance: widget.watchList[index].balance,
                        lastTransaction: widget.watchList[index].lastAmount,
                        percentage: widget.watchList[index].percenttage,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WatchListDetailScreen(
                                watchListModel: widget.watchList[index],
                                watchList: widget.watchList,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
            const Center(child: Text("Transaction")),
            const Center(child: Text("Analysis")),
            const Center(child: Text("Account")),
          ],
        ),
      ),
    );
  }
}
