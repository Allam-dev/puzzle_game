part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GameWin extends GameState{}

class GameLoadBoard extends GameState{}

class GameCrash extends GameState{}
