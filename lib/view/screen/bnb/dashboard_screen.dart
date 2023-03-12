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
                BlocBuilder<DarkModeCubit, DarkModeInitialState>(
                  builder: (context, state) {
                    return QuickIconWidget(
                      text: state.isDarkMode ? "Light Mode" : "Dark Mode",
                      icon: Icons.language,
                      onTap: () {
                        bool isDark = state.isDarkMode;
                        isDark = !isDark;
                        BlocProvider.of<DarkModeCubit>(context)
                            .changeTheme(isDark);
                      },
                    );
                  },
                ),
                QuickIconWidget(
                  text: "Rate App",
                  icon: Icons.star,
                  onTap: () {},
                ),
                QuickIconWidget(
                  text: "Feedback",
                  icon: Icons.email,
                  onTap: () {},
                ),
                QuickIconWidget(
                  text: "T&C",
                  icon: Icons.import_contacts,
                  onTap: () {},
                ),
                QuickIconWidget(
                  text: "About",
                  icon: Icons.language,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ),
                    );
                  },
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
          QuickIconTileWidget(
            text: "Check update",
            icon: Icons.update,
            onTap: () {},
          ),
          QuickIconTileWidget(
            text: "Release notes",
            icon: Icons.store,
            onTap: () {},
          ),
          QuickIconTileWidget(
            text: "Version 1.0",
            icon: Icons.android_outlined,
            onTap: () {},
          ),
          QuickIconTileWidget(
            text: "Delete Account",
            icon: Icons.account_balance,
            onTap: () {},
          ),
          QuickIconTileWidget(
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
