import 'package:simple_bank/utils/import.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market"),
      ),
      body: const Center(
        child: Text(
          "Market Screen",
          style: TextStyle(
            fontSize: size12,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
