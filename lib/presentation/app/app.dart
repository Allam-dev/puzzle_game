import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/core/helpers/debugging/log.dart';
import 'package:hack_puzzle/generated/l10n.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/app/cubit/app_cubit.dart';
import 'package:hack_puzzle/presentation/navigation/app_router.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/all_levels_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            title: 'Puzzle Game',
            navigatorKey: _navigatorKey,
            scaffoldMessengerKey: _scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
                brightness: Brightness.light,
                appBarTheme: AppBarTheme(
                  color: AppColors.white,
                  iconTheme: IconThemeData(color: AppColors.black),
                  centerTitle: true,
                  titleTextStyle:
                      TextStyle(color: AppColors.black, fontSize: 20),
                  actionsIconTheme: IconThemeData(color: AppColors.black),
                )),
            initialRoute: const AllLevelsScreen().route,
            routes: AppRouter.routes,
          );
        },
      ),
    );
  }

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
