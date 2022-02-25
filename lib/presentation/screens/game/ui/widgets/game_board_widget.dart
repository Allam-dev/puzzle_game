import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';

class GameBoardWidget extends StatelessWidget {
  GameBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameCubit gameCubit = BlocProvider.of<GameCubit>(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxWidth,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.grey300, borderRadius: BorderRadius.circular(20)),
          child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gameCubit.puzzle.rows,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: gameCubit.puzzle.list.length,
              itemBuilder: (contex, index) {
                if (gameCubit.puzzle.list.indexOf(0) == index) {
                  return const SizedBox.shrink();
                } else {
                  return _PuzzleSquare(index: index);
                }
              }),
        );
      },
    );
  }
}

class _PuzzleSquare extends StatelessWidget {
  int index;
  _PuzzleSquare({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameCubit gameCubit = BlocProvider.of<GameCubit>(context);
    return GestureDetector(
      onTap: () async {
        await gameCubit.play(index);
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(constraints.minWidth/4),
              color: AppColors.white,
            ),
            child: Center(
              child: Text(
                "${gameCubit.puzzle.list[index]}",
                style: TextStyle(fontSize: constraints.minWidth / 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
