import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/puzzle_square.dart';
import 'package:hack_puzzle/presentation/screens/screen.dart';

class GameScreen extends Screen {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();

  @override
  Screen get screen => this;
}

class _GameScreenState extends ScreenState<GameScreen> {
  late final GameCubit gameCubit;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if(state is GameInitial || state is GameLoadBoard){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gameCubit.puzzle.rows,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: gameCubit.puzzle.list.length,
              itemBuilder: (contex, index) {
                if (gameCubit.puzzle.list.indexOf(0) == index) {
                  return const SizedBox.shrink();
                } else {
                  return PuzzleSquare(index: index);
                }
              });
          }else{
            return Container();
          }
        },
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
