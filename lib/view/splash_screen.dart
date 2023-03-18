import 'dart:async';

import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/authentication/login_screen.dart';
import 'package:simple_bank/view/screen/bnb/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  Future<void> initTimer() async {
    Timer(const Duration(seconds: 2), gotoLogInScreen);
  }

  void gotoHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (route) => false,
    );
  }

  void gotoLogInScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
      (route) => false,
    );
  }

  void gotoHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
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
    );
  }
}
