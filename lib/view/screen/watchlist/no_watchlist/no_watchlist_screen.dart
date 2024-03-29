import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/no_watchlist/component/grid_card_component.dart';
import 'package:simple_bank/view/screen/watchlist/no_watchlist/component/slider_component.dart';
import 'package:simple_bank/view/widget/dialog_box/dialog_box.dart';

class NoWatchListScreen extends StatelessWidget {
  const NoWatchListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: "Digital",
            style: Theme.of(context).appBarTheme.titleTextStyle,
            children: [
              TextSpan(
                text: "Money",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    // TextEditingController emailController =
                    //     TextEditingController();
                    // FocusNode emailFn = FocusNode();
                    DialogBox.addWatchListDialog(context);
                  },
                  child: const SliderD(
                    one: "Create",
                    two: "Bank",
                    three: "WatchList",
                    icon: Icons.account_balance_outlined,
                  ),
                ),
                const SliderD(
                  one: "Create",
                  two: "Portfolio",
                  three: "WatchList",
                  icon: Icons.bar_chart,
                ),
                const SliderD(
                  one: "Create",
                  two: "Wallet",
                  three: "WatchList",
                  icon: Icons.wallet_rounded,
                ),
                const SliderD(
                  one: "Create",
                  two: "Trading",
                  three: "WatchList",
                  icon: Icons.show_chart_sharp,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Create Watchlist ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 16,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GridCardComponent(
                    one: "For",
                    two: "Yourself",
                    icon: Icons.person,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GridCardComponent(
                    one: "For",
                    two: "Family",
                    icon: Icons.group,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: GridCardComponent(
                    one: "For",
                    two: "Organization",
                    icon: Icons.home_work_outlined,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GridCardComponent(
                    one: "For",
                    two: "Business",
                    icon: Icons.business_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
