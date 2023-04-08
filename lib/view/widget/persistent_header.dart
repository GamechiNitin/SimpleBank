import 'package:simple_bank/utils/import.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  PersistentHeader({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: 35.5,
      child: child,
    );
  }

  @override
  double get maxExtent => 35.5;

  @override
  double get minExtent => 35.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
