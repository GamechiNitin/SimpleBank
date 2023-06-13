import 'package:simple_bank/utils/import.dart';

enum RouteEnum {
  initial,
  home,
  splash,
  watchlist,
  login,
  signup,
  addscribs;
}

class DmRoutes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: RouteEnum.initial.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/${RouteEnum.splash.name}',
        name: RouteEnum.splash.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/${RouteEnum.signup.name}',
        name: RouteEnum.signup.name,
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: '/${RouteEnum.login.name}',
        name: RouteEnum.login.name,
        builder: (context, state) {
          return const LogInScreen();
        },
      ),
      GoRoute(
        path: '/${RouteEnum.home.name}',
        name: RouteEnum.home.name,
        builder: (context, state) {
          return const Home();
        },
      ),
      GoRoute(
        path: '/${RouteEnum.watchlist.name}',
        name: RouteEnum.watchlist.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: WatchListScreen());
        },
        routes: const [],
      ),
      GoRoute(
        path: '/${RouteEnum.addscribs.name}',
        name: RouteEnum.addscribs.name,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: AddScribsPage(
              watchlistModel: state.extra as WatchlistModel,
            ),
          );
        },
      ),
    ],
  );
}
