import 'dart:developer';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:simple_bank/utils/import.dart';
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

  int? selectedWatchList;
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
                                                          fontSize: size12),
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
                                      itemCount: 10,
                                      // padding: const EdgeInsets.only(top: 8),
                                      itemBuilder: (context, index) {
                                        return RadioWidget(
                                          title: "Nitin Gamechi",
                                          subTitle: "20 Scribs",
                                          type: "Personal",
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
                    scribsNumber: "10 scribs",
                    watchListName: "NitinGamechi",
                    watchListType: "Personal Watchlist",
                  ),
                  IconButton(
                    onPressed: () {},
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
          flChart(),
          // Center(child: Text("Bank",),),
          // HomeScreen(),
          const Center(child: Text("Stock")),
          const Center(child: Text("Funds")),
          const Center(child: Text("Crypto")),
          const Center(child: Text("Coins")),
          const Center(child: Text("Wallets")),
        ],
      ),
    );
  }

  Widget flChart() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, right: 16),
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: LineChart(
            LineChartData(
              // backgroundColor: kLPrimaryColor,

              gridData: FlGridData(
                drawVerticalLine: false,
              ),
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    // interval: 7000,
                    // getTitlesWidget: (value, meta) {},
                  ),
                  axisNameWidget: Text(
                    "Years",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  axisNameSize: 20,
                ),
                rightTitles: AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 7000,
                    // getTitlesWidget: (value, meta) {},
                  ),
                  drawBehindEverything: true,
                  axisNameWidget: Text(
                    "Amount (Money) Rs ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  axisNameSize: 20,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).textTheme.labelSmall!.color!,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Theme.of(context).textTheme.labelSmall!.color!,
                    width: 2,
                  ),
                ),
              ),
              clipData: FlClipData(
                bottom: false,
                left: false,
                right: false,
                top: true,
              ),
              // read about it in the LineChartData section
              // baselineX: 2,
              betweenBarsData: [
                // BetweenBarsData(
                //   fromIndex: 0,
                //   toIndex: 11,
                //   color: kErrorColor,
                // ),
              ],
              // maxX: 2,

              lineBarsData: [
                LineChartBarData(
                  belowBarData: BarAreaData(
                    show: true,
                    // color: kPrimaryColor,
                    gradient: LinearGradient(
                      colors: [
                        kBlueColor,
                        kPrimaryColor.withOpacity(0.2),
                        kBlueAccentColor.withOpacity(0.1),
                        // kErrorColor,
                      ],
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                  ),
                  lineChartStepData: LineChartStepData(
                    stepDirection: 20,
                  ),
                  isCurved: true,
                  color: kWhiteColor,
                  gradient: const LinearGradient(
                    colors: [
                      kWhiteColor,
                      // kBlueAccentColor,
                      kPrimaryColor,
                      // kErrorColor,
                    ],
                  ),
                  barWidth: 3,
                  spots: List.generate(
                    12,
                    (index) => FlSpot(
                      index.toDouble() * 10,
                      index.isEven ? index * 2000 : index * 2500,
                    ),
                  ),
                ),
              ],
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ],
    );
  }
}
