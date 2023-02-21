import 'package:simple_bank/utils/import.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(
            fontSize: size12,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
