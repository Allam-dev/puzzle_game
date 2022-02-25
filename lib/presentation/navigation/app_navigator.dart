import 'package:flutter/material.dart';
import 'package:hack_puzzle/presentation/app/app.dart';

abstract class AppNavigator {
  static void push({required String routeName}) {
    App.navigatorKey.currentState!.pushNamed(routeName);
  }

  static void pop() {
    App.navigatorKey.currentState!.pop();
  }

  static void pushReplacement({required String routeName}) {
    App.navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void pushAndRemoveUntil(
      {required String routeName, required RoutePredicate predicate}) {
    App.navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, predicate);
  }
}
