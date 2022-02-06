import 'package:flutter/material.dart';

import '../../main.dart';

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