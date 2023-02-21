import 'package:simple_bank/utils/import.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool prefThemeValue = await ThemePreference.getTheme();
  runApp(
    BlocProvider<DarkModeCubit>(
      create: (context) => DarkModeCubit()..changeTheme(prefThemeValue),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeInitialState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Simple Bank',
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
