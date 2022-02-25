part of 'app_cubit.dart';

@immutable
abstract class AppState {
  Locale locale;
  AppState({this.locale = const Locale('en')});
}

class AppInitial extends AppState {
  AppInitial({required Locale locale}) : super(locale: locale);
}

class AppLoad extends AppState {
  AppLoad({required Locale locale}) : super(locale: locale);
}
