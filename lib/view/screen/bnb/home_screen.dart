import 'package:simple_bank/utils/import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WatchlistModel> watchList = [
    WatchlistModel(bankName: "State Bank of India", shortBankName: "SBI"),
    WatchlistModel(bankName: "Bank of Baroda", shortBankName: "BOB"),
    WatchlistModel(
        bankName: "Union Bank of India", shortBankName: "Union Bank"),
  ];
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
      body: ListView.builder(
        itemCount: watchList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return WatchlistComponent(
            shortName: watchList[index].shortBankName ?? "",
            bankName: watchList[index].bankName ?? "",
          );
        },
      ),
    );
  }
}
