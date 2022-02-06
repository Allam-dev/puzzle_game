import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/presentation/app_blocs.dart';
import 'package:hack_puzzle/presentation/navigation/app_router.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/all_puzzles_screen.dart';

void main() {
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
    return AppBlocs(
      child: MaterialApp(
        title: 'Puzzle Game',
        navigatorKey: _navigatorKey,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.gray,
          titleTextStyle: TextStyle(color: AppColors.black),
          actionsIconTheme: IconThemeData(color: AppColors.black)
        )),
        initialRoute: const AllPuzzlesScreen().route,
        routes: AppRouter.routes,
      ),
    );
  }

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
