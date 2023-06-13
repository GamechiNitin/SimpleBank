import 'dart:async';
import 'package:simple_bank/utils/import.dart';

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
    Timer(const Duration(seconds: 1), gotoLogInScreen);
  }

  void gotoLogInScreen() {
    GoRouter.of(context).pushReplacementNamed(RouteEnum.login.name);
  }

  void gotoHome() {
    GoRouter.of(context).pushReplacementNamed(RouteEnum.home.name);
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
