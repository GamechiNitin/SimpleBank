import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/utils/import.dart';

class WatchListHome extends StatelessWidget {
  const WatchListHome({super.key});

  @override
  Widget build(BuildContext context) {
    if (watchList.isNotEmpty) {
      return const WatchListScreen();
    } else {
      return const NoWatchListScreen();
    }
  }
}
