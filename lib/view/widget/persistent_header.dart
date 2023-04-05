import 'package:simple_bank/utils/import.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  PersistentHeader({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: child,
    );
  }

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
