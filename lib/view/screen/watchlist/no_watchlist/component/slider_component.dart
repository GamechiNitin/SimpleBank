import 'package:simple_bank/utils/import.dart';

class SliderD extends StatelessWidget {
  const SliderD(
      {super.key,
      required this.one,
      required this.two,
      required this.three,
      required this.icon});
  final String one;
  final String two;
  final String three;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width - 30,
          decoration: state.isDarkMode
              ? CustomDecoration.watchDarkDeocoration
              : CustomDecoration.watchLightDeocoration,
          // decoration: BoxDecoration(
          //   color: kDarkGrey1Color,
          //   borderRadius: BorderRadius.circular(10),
          //   boxShadow: const [
          //     BoxShadow(
          //       color: Colors.black87,
          //       offset: Offset(10, 10),
          //       blurRadius: 6,
          //       spreadRadius: 1,
          //     ),
          //     BoxShadow(
          //       color: Colors.black26,
          //       offset: Offset(-10, -10),
          //       blurRadius: 6,
          //       spreadRadius: 1,
          //     ),
          //   ],
          // ),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: one,
                    style:
                        Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                              fontSize: 35,
                              height: 1,
                            ),
                    children: [
                      TextSpan(
                        text: "\n$two ",
                        style: TextStyle(
                          fontSize: 48,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: three,
                        style: TextStyle(
                          fontSize: 40,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle
                              ?.color,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Icon(
                icon,
                size: 120,
              )
            ],
          ),
        );
      },
    );
  }
}
