import 'package:flutter/material.dart';
import 'package:simple_bank/model/watchlist_model.dart';
import 'package:simple_bank/utils/colors.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_home/component/watchlist_component.dart';

class WatchListDetailScreen extends StatelessWidget {
  const WatchListDetailScreen(
      {super.key, required this.watchListModel, required this.watchList});
  final WatchlistModel watchListModel;
  final List<WatchlistModel> watchList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            stretch: false,
            expandedHeight: 120.0,
            collapsedHeight: kToolbarHeight,
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchListModel.bankName ?? "",
                  style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                        fontSize: 12,
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      watchListModel.shortBankName ?? "",
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
                      watchListModel.type ?? "",
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: WatchlistComponent(
                    isSelected: index == 0,
                    imageUrl: "https://picsum.photos/200",
                    shortName: watchList[index].shortBankName,
                    fullName: watchList[index].bankName,
                    balance: watchList[index].balance,
                    lastTransaction: watchList[index].lastAmount,
                    percentage: watchList[index].percenttage,
                    onTap: () {},
                  ),
                );
              },
              childCount: watchList.length,
            ),
          ),
        ],
      ),
    );
  }
}
