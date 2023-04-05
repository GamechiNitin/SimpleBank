import 'package:flutter/gestures.dart';
import 'package:simple_bank/utils/import.dart';

class PersistentTabBar extends StatelessWidget {
  const PersistentTabBar({super.key,required this.controller, required this.tabs});
  final TabController? controller;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 0.2,
                ),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: controller,
                indicatorColor: kPrimaryColor,
                dividerColor: Colors.transparent,
                isScrollable: true,
                dragStartBehavior: DragStartBehavior.start,
                labelColor: Theme.of(context).textTheme.bodySmall?.color,
                labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                unselectedLabelColor: Theme.of(context).disabledColor,
                labelPadding: const EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  right: 20,
                  left: 20,
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 12),
                tabs: tabs),
          ),
        ],
      ),
    );
  }
}
