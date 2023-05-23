import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/scribslist_details/scribs_details_screen.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist/component/grid_component.dart';
import 'package:simple_bank/view/widget/chart/line_chart.dart';

class BankTab extends StatefulWidget {
  const BankTab({super.key});

  @override
  State<BankTab> createState() => _BankTabState();
}

class _BankTabState extends State<BankTab> {
  bool isGridView = false;

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const LineChartWidget(),
        Container(
          margin: const EdgeInsets.only(top: 16),
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }
}
