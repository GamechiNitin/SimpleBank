import 'dart:developer';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/widget/radio_widget.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  int? selectedWatchList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.5,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DMWidget(),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
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
                                            color: Theme.of(context).hintColor,
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
                                          log(val.toString());
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NitinGamechi",
                            style: Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.copyWith(
                                  fontSize: 12,
                                ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "10 scribs",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 8,
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
                                " Personal Watchlist",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          // size: 25,
                        ),
                      )
                    ],
                  ),
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
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16),
        children: const [],
      ),
    );
  }
}
