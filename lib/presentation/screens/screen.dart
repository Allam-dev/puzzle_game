import 'package:flutter/cupertino.dart';
import 'package:hack_puzzle/presentation/navigation/app_router.dart';

abstract class Screen extends StatefulWidget{
  const Screen({Key? key}) : super(key: key);

  Screen get screen;

  String get route => AppRouter.addRoute(screen: screen);
}

abstract class ScreenState<T extends Screen> extends State<T>{
  String get routeName;

  @override
  void dispose() {
    AppRouter.removeRoute(routeName: routeName);
    super.dispose();
  }
}