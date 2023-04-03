import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_bank/model/watchlist_model.dart';
import 'package:simple_bank/utils/colors.dart';
import 'package:simple_bank/view/screen/watchlist/no_watchlist/no_watchlist_screen.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_home/component/watchlist_component.dart';

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

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 6,
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            stretch: false,
            expandedHeight: 150.0,
            collapsedHeight: kToolbarHeight,
            titleSpacing: 0,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.watchListModel.bankName ?? "",
                  style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
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
                )
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.watchListModel.bankName ?? "",
                  style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
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
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 35),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 0.2,
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: controller,
                  indicatorColor: kPrimaryColor,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  dragStartBehavior: DragStartBehavior.start,
                  labelColor: Theme.of(context).textTheme.bodySmall?.color,
                  labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                  unselectedLabelColor: Theme.of(context).disabledColor,
                  labelPadding: const EdgeInsets.only(
                    top: 6,
                    bottom: 6,
                    right: 20,
                    left: 20,
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 12),
                  tabs: const [
                    Text("Chart"),
                    Text("Transaction"),
                    Text("Analysis"),
                    Text("Account"),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              controller: controller,
              children: const [
                Center(child: Text("Chart")),
                Center(child: Text("Transaction")),
                Center(child: Text("Analysis")),
                Center(child: Text("Account")),
              ],
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.only(left: 20, right: 20),
          //         child: WatchlistComponent(
          //           isSelected: index == 0,
          //           imageUrl: "https://picsum.photos/200",
          //           shortName: widget.watchList[index].shortBankName,
          //           fullName: widget.watchList[index].bankName,
          //           balance: widget.watchList[index].balance,
          //           lastTransaction: widget.watchList[index].lastAmount,
          //           percentage: widget.watchList[index].percenttage,
          //           onTap: () {},
          //         ),
          //       );
          //     },
          //     childCount: widget.watchList.length,
          //   ),
          // ),
        ],
      ),
    );
  }
}
