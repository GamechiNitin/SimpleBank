import 'package:simple_bank/utils/import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: kAppBarElevation,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: "Simple",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kBlackColor,
            ),
            children: [
              TextSpan(
                text: "Bank",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Welcome to Simple",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
                children: [
                  TextSpan(
                    text: "Bank",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              mTaglineMessage,
              style: TextStyle(
                fontSize: size12,
                color: kBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
