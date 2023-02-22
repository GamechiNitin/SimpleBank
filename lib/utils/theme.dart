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
      scaffoldBackgroundColor:
          ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: kWhiteColor,
        onPrimary: kWhiteColor,
        secondary: kWhiteColor,
        onSecondary: kWhiteColor,
        error: kBlackColor,
        onError: ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
        background: ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
        onBackground: ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
        surface: kPrimaryColor,
        onSurface: ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: size12,
          color: kBlackColor,
          // height: 0,
        ),
        bodySmall: TextStyle(
          fontSize: size8,
          color: kBlackColor,
        ),
      )
      // colorSchemeSeed: kPrimaryColor,
      );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    // colorSchemeSeed: kPrimaryColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kDarkGrey1Color,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: kPrimaryColor,
      onPrimary: kBlackColor,
      secondary: kDarkGreyColor,
      onSecondary: kPrimaryColor,
      error: kPrimaryColor,
      onError: kPrimaryColor,
      background: kPrimaryColor,
      onBackground: kPrimaryColor,
      surface: ColorScheme.fromSeed(seedColor: kPrimaryColor).primary,
      onSurface: kPrimaryColor,
    ),
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
    // Text Theme
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: size12,
        color: kWhiteColor,
        // height: 0,
      ),
      bodySmall: TextStyle(
        fontSize: size8,
        color: kWhiteColor,
      ),
    ),
  );
}
