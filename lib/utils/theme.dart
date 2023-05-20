import 'package:google_fonts/google_fonts.dart';
import 'package:simple_bank/utils/import.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    switchTheme: const SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: MaterialStatePropertyAll(kTransparentColor),
    ),
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
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return kPrimaryColor.withOpacity(.32);
          }
          return kPrimaryColor;
        },
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kWhiteColor,
      titleTextStyle: GoogleFonts.poppins(
        color: kBlackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    primaryColor: kPrimaryColor,

    scaffoldBackgroundColor:
        ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
    dividerColor: Colors.black38,
    splashColor: ColorScheme.fromSeed(seedColor: kPrimaryColor).primary,
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
      onSurface: ColorScheme.fromSeed(seedColor: kPrimaryColor).primary,
      shadow: kWhiteColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      modalBackgroundColor:
          ColorScheme.fromSeed(seedColor: kPrimaryColor).background,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14,
        color: kHintColor,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        color: kBlackColor,
      ),
      bodySmall: GoogleFonts.notoSerif(
        color: kBlackColor,
      ),
      labelSmall: GoogleFonts.poppins(
        color: kLightDisabledColor,
      ),
      displaySmall: GoogleFonts.poppins(
        color: kBlackColor.withOpacity(0.5),
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    // colorSchemeSeed: kPrimaryColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kDarkGrey1Color,
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: kDarkGreyColor,
    ),
    dividerColor: Colors.white38,
    splashColor: ColorScheme.fromSeed(seedColor: kPrimaryColor).primary,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: kPrimaryColor,
      onPrimary: kBlackColor,
      secondary: kDarkGreyColor,
      onSecondary: kLPrimaryColor,
      error: kPrimaryColor,
      onError: kPrimaryColor,
      background: kDarkGrey1Color,
      onBackground: kPrimaryColor,
      surface: ColorScheme.fromSeed(seedColor: kPrimaryColor).primary,
      shadow: Colors.teal.withOpacity(0.3),
      // shadow: kPrimaryColor.withOpacity(0.2),
      onSurface: kPrimaryColor,
    ),
    useMaterial3: true,
    unselectedWidgetColor: kLightWhiteColor,
    disabledColor: kLightWhiteColor,
    appBarTheme: AppBarTheme(
      // titleSpacing: 0,
      backgroundColor: kDarkGreyColor,
      titleTextStyle: GoogleFonts.poppins(
        color: kWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    switchTheme: const SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: MaterialStatePropertyAll(kTransparentColor),
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
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 12,
        color: kLightWhiteColor,
      ),
    ),

    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(color: kWhiteColor),
      labelSmall: GoogleFonts.poppins(color: kLightWhiteColor),
      bodySmall: GoogleFonts.notoSerif(color: kWhiteColor),
      displaySmall: GoogleFonts.poppins(color: kWhiteColor.withOpacity(0.6)),
    ),
  );
}
