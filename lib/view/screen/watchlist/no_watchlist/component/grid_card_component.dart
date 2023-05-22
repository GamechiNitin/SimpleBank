import 'package:simple_bank/utils/import.dart';

class GridCardComponent extends StatelessWidget {
  const GridCardComponent({
    super.key,
    required this.one,
    required this.two,
    required this.icon,
  });
  final String one;
  final String two;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
        builder: (context, state) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: state.isDarkMode
            ? CustomDecoration.watchDarkDeocoration
            : CustomDecoration.watchLightDeocoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: one,
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      fontSize: 20,
                      height: 1.2,
                      fontFamily:
                          Theme.of(context).textTheme.bodySmall?.fontFamily,
                    ),
                children: [
                  TextSpan(
                    text: "\n$two ",
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          Theme.of(context).textTheme.bodySmall?.fontFamily,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
