import 'package:flutter/material.dart';
import 'package:hack_puzzle/presentation/app/app.dart';

abstract class SnackBarWithoutContext{

  static void show({required String message}){
    App.scaffoldMessengerKey.currentState?.showSnackBar(_snackBar(message: message));
  }

  static SnackBar _snackBar({required String message}){
    return SnackBar(
      content: Text(message),
    );
  }
}