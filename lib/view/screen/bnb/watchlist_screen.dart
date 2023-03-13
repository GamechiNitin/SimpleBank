import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/bnb/component/slider_component.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
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
      body: Column(
        children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SliderD(
                  one: "Create",
                  two: "Bank",
                  three: "WatchList",
                  icon: Icons.account_balance_outlined,
                ),
                SliderD(
                  one: "Create",
                  two: "Portfolio",
                  three: "WatchList",
                  icon: Icons.bar_chart,
                ),
                SliderD(
                  one: "Create",
                  two: "Wallet",
                  three: "WatchList",
                  icon: Icons.wallet_rounded,
                ),
                SliderD(
                  one: "Create",
                  two: "Trading",
                  three: "WatchList",
                  icon: Icons.show_chart_sharp,
                ),
              ],
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
