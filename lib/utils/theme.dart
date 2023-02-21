import 'package:simple_bank/utils/import.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kWhiteColor,
      selectedIconTheme: IconThemeData(color: kBlackColor),
      unselectedIconTheme: IconThemeData(color: kBlackColor),
      selectedLabelStyle: TextStyle(
        color: kBlackColor,
        fontSize: size8,
        letterSpacing: 0.2,
      ),
      unselectedLabelStyle: TextStyle(
        color: kBlackColor,
        fontSize: size8,
        letterSpacing: 0.2,
      ),
    ),
    // brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: kWhiteColor,
      titleTextStyle: TextStyle(
        color: kBlackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    // colorSchemeSeed: kPrimaryColor,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    // colorSchemeSeed: kPrimaryColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kDarkGrey1Color,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkGreyColor,
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kBlackColor,
      selectedIconTheme: IconThemeData(color: kWhiteColor),
      unselectedIconTheme: IconThemeData(color: kWhiteColor),
      selectedLabelStyle: TextStyle(
        color: kWhiteColor,
        fontSize: size8,
        letterSpacing: 0.2,
      ),
      unselectedLabelStyle: TextStyle(
        color: kWhiteColor,
        fontSize: size8,
        letterSpacing: 0.2,
      ),
    ),
  );
}
