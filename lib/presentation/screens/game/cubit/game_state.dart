part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GameWin extends GameState {}

class GameLoad extends GameState {}

class GameCrash extends GameState {}
