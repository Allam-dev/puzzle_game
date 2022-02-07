part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GameWin extends GameState{}

class GameLoadBoard extends GameState{}

class GameSteps extends GameState{
  int steps;
  GameSteps({required this.steps});
}

class GameCrash extends GameState{}
