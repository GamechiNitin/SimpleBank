import 'package:flutter/gestures.dart';
import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/scribs_details_screen.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/component/grid_component.dart';
import 'package:simple_bank/view/widget/chart/line_chart.dart';
import 'package:simple_bank/view/widget/radio_widget.dart';
import 'package:simple_bank/view/widget/watchlist_dropdown.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  var currentIndex = 0;
  bool isGridView = false;

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

  int selectedWatchList = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.7,
        centerTitle: false,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const DMWidget(),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // color: kDarkGrey2Color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WatchListDropdownWidget(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, buildNow) {
                            return Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Select a watchlist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: size14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(300),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .dividerColor,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.settings,
                                                  size: size18,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.color,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "Manage",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontSize: size12,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              // size: 25,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: ListView.builder(
                                      itemCount: watchList.length,
                                      // padding: const EdgeInsets.only(top: 8),
                                      itemBuilder: (context, index) {
                                        return RadioWidget(
                                          title:
                                              watchList[index].watchListName ??
                                                  "",
                                          subTitle:
                                              "${watchList.length} Scribs",
                                          type:
                                              watchList[index].watchListName ??
                                                  "",
                                          value: index,
                                          groupValue: selectedWatchList,
                                          onChanged: (val) {
                                            // log(val.toString());
                                            selectedWatchList = val!;
                                            buildNow(() {});
                                          },
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                        },
                      );
                    },
                    scribsNumber:
                        "${watchList[selectedWatchList].scribsCount} scribs",
                    watchListName:
                        watchList[selectedWatchList].watchListName ?? "",
                    watchListType:
                        watchList[selectedWatchList].watchListName ?? "",
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NoWatchListScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      // size: 25,
                      color: Theme.of(context).hintColor,
                    ),
                  )
                ],
              ),
            ),
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
                Text("Bank"),
                Text("Stock"),
                Text("Funds"),
                Text("Crypto"),
                Text("Coins"),
                Text("Wallets"),
              ],
            ),
          ),
        ),
      ),
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
                        text: "Scribs",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: size14,
                            ),
                        children: [
                          TextSpan(
                            text: "List",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  itemCount: scribsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GridComponent(
                      isSelected: index == 0,
                      shortName: scribsList[index].shortBankName,
                      fullName: scribsList[index].bankName,
                      balance: scribsList[index].balance,
                      lastTransaction: scribsList[index].lastAmount,
                      percentage: scribsList[index].percenttage,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScribsListDetailScreen(
                              scribsListModel: scribsList[index],
                              scribsList: scribsList,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              else
                ListView.builder(
                  itemCount: scribsList.length,
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
                      shortName: scribsList[index].shortBankName,
                      fullName: scribsList[index].bankName,
                      balance: scribsList[index].balance,
                      lastTransaction: scribsList[index].lastAmount,
                      percentage: scribsList[index].percenttage,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScribsListDetailScreen(
                              scribsListModel: scribsList[index],
                              scribsList: scribsList,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
          const Center(child: Text("Stock")),
          const Center(child: Text("Funds")),
          const Center(child: Text("Crypto")),
          const Center(child: Text("Coins")),
          const Center(child: Text("Wallets")),
        ],
      ),
    );
  }
}