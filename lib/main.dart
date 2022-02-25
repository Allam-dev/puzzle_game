import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/navigation/app_router.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/all_levels_screen.dart';

void main() {
  injectionSetUp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Puzzle Game',
        navigatorKey: _navigatorKey,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.black),
          centerTitle: true,
          color: AppColors.purple,
          titleTextStyle: TextStyle(color: AppColors.black),
          actionsIconTheme: IconThemeData(color: AppColors.black)
        )),
        initialRoute: const AllLevelsScreen().route,
        routes: AppRouter.routes,
    );
  }

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
