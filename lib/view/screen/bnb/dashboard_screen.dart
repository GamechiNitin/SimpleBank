import 'package:simple_bank/utils/import.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "UCC : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: "78***65",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.verified_user_outlined,
                            size: kSmallIconSize,
                            color: kErrorColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Nitin Gamechi",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "ni*********i@gmail.com",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_sharp,
                  size: kIconSize,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedIconTheme
                      ?.color,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Theme.of(context).colorScheme.secondary,
            // color: kDarkGreyColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyWidget(
                  text: "Dark Mode",
                  icon: Icons.language,
                  onTap: () {},
                ),
                MyWidget(
                  text: "Rate App",
                  icon: Icons.star,
                  onTap: () {},
                ),
                MyWidget(
                  text: "Feedback",
                  icon: Icons.email,
                  onTap: () {},
                ),
                MyWidget(
                  text: "T&C",
                  icon: Icons.import_contacts,
                  onTap: () {},
                ),
                MyWidget(
                  text: "About",
                  icon: Icons.language,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Account Settings",
              textAlign: TextAlign.start,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          MyWidget2(
            text: "Check update",
            icon: Icons.update,
            onTap: () {},
          ),
          MyWidget2(
            text: "Release notes",
            icon: Icons.store,
            onTap: () {},
          ),
          MyWidget2(
            text: "Version 1.0",
            icon: Icons.android_outlined,
            onTap: () {},
          ),
          MyWidget2(
            text: "Delete Account",
            icon: Icons.account_balance,
            onTap: () {},
          ),
          MyWidget2(
            text: "Logout",
            icon: Icons.logout,
            onTap: () {},
          ),
          Expanded(
            child: Center(
              child: Text(
                "App Version 1.0",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.all(6),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kDarkGrey2Color,
          ),
          child: Icon(
            icon,
            size: 30,
            color: kWhiteColor,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}

class MyWidget2 extends StatelessWidget {
  const MyWidget2(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: kBlackColor,
            width: 0.2,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kDarkGreyColor,
            ),
            child: Icon(
              icon,
              // size: 30,
              color: kWhiteColor,
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
