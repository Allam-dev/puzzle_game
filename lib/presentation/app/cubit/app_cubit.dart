import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/packages/hive/hive_constants.dart';
import 'package:hack_puzzle/presentation/widgets/snackbar_without_context.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required Locale locale}) : super(AppInitial(locale: locale));

  Future<void> changeLanguage(Locale locale) async {
    try {
      Box box = await Hive.openBox(HiveConstants.appBox);
      await box.put(HiveConstants.languageKey, locale.languageCode);
      await box.close();
      emit(AppLoad(locale: locale));
    } catch (ex) {
      SnackBarWithoutContext.show(message: "error");
    }
  }
}
