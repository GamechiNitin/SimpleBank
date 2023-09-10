import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/more/feedback_screen.dart';
import 'package:simple_bank/view/widget/user_card_widget.dart';

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
          UserCardWidget(
            imageUrl: 'https://picsum.photos/200/300',
            email: 'ni*********i@gmail.com',
            ucc: '78***65',
            userName: 'NitinGamechi',
            onTap: () {
              GoRouter.of(context).pushNamed(RouteEnum.updateProfile.name);
            },
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FeedbackScreen(),
                      ),
                    );
                  },
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
