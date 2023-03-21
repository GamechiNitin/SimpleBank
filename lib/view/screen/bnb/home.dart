import 'package:simple_bank/utils/import.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    tabController?.addListener(() {
      currentIndex = tabController!.index;
      _notify();
    });
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: TabBarView(
        controller: tabController,
        children: const [
          WatchListScreen(),
          // HomeScreen(),
          MarketScreen(),
          DashboardScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: kToolbarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabs: [
            BottomNavIconWidget(
              label: "Watchlist",
              icon: Icons.favorite,
              currentIndex: currentIndex == 0,
            ),
            BottomNavIconWidget(
              label: "Market",
              icon: Icons.language,
              currentIndex: currentIndex == 1,
            ),
            BottomNavIconWidget(
              label: "Dashboard",
              icon: Icons.menu,
              currentIndex: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavIconWidget extends StatelessWidget {
  const BottomNavIconWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.currentIndex});
  final String label;
  final IconData icon;
  final bool currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(microseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
          margin: const EdgeInsets.only(bottom: 8),
          width: kToolbarHeight,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex ? kPrimaryColor : null,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Icon(
          icon,
          size: kIconSize,
          color: currentIndex
              ? Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedIconTheme
                  ?.color
              : Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme
                  ?.color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            label,
            style: currentIndex
                ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedLabelStyle,
          ),
        )
      ],
    );
  }
}
