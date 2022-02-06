import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/presentation/navigation/app_navigator.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/game_screen.dart';

class PuzzleWidget extends StatelessWidget {
  Puzzle puzzle;
  PuzzleWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (puzzle.isOpen == true) {
      return _OpenPuzzleWidget(
        puzzle: puzzle,
      );
    } else {
      return _ClosePuzzleWidget(puzzle: puzzle);
    }
  }
}

class _OpenPuzzleWidget extends StatelessWidget {
  Puzzle puzzle;
  _OpenPuzzleWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxWidth,
          color: Color(0xffd18a4c),
          child: Center(child: Text("${puzzle.rows} x ${puzzle.columns}")),
        );
      },
    );
  }
}

class _ClosePuzzleWidget extends StatelessWidget {
  Puzzle puzzle;
  _ClosePuzzleWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<GameCubit>(context).puzzle = puzzle;
        AppNavigator.push(routeName: GameScreen().route);
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxWidth / 1.5,
            decoration: BoxDecoration(
                color: Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${puzzle.rows} x ${puzzle.columns}",
                  style: const TextStyle(
                // color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Level : ${puzzle.id}",style: TextStyle(
                  fontSize: 20,
                ),),
                Text("time : ${puzzle.timeBySec} sec",style: TextStyle(
                  fontSize: 20,
                ),)
              ],
            ),
          );
        },
      ),
    );
  }
}
