// ignore_for_file: must_be_immutable
import 'package:hack_puzzle/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';

class LevelWidget extends StatelessWidget {
  Puzzle puzzle;
  LevelWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (puzzle.isOpen == true) {
      return _OpenLevelWidget(
        puzzle: puzzle,
      );
    } else {
      
      return _CloseLevelWidget(puzzle: puzzle);
    }
  }
}

class _OpenLevelWidget extends StatelessWidget {
  Puzzle puzzle;
  _OpenLevelWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AllLevelsCubit allPuzzlesCubit =
        BlocProvider.of<AllLevelsCubit>(context);
    return GestureDetector(
        onTap: () {
          allPuzzlesCubit.gotoGameScreen(puzzle: puzzle);
        },
        child: (puzzle.steps == 0 && puzzle.timeBySec == 0)
            ? notPlayed()
            : played());
  }

  Widget played() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxWidth / 1.5,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${puzzle.rows} x ${puzzle.columns}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.touch_app_outlined,
                        size: 40,
                      ),
                      Text(
                        "${puzzle.steps}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: AppColors.black,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 35,
                      ),
                      Text(
                        "${puzzle.timeBySec} ${S.of(context).s}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget notPlayed() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxWidth / 1.5,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${puzzle.rows} x ${puzzle.columns}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(S.of(context).play_now),
            ],
          ),
        );
      },
    );
  }
}

class _CloseLevelWidget extends StatelessWidget {
  Puzzle puzzle;
  _CloseLevelWidget({Key? key, required this.puzzle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxWidth / 1.5,
          decoration: BoxDecoration(
              color: AppColors.grey400, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${puzzle.rows} x ${puzzle.columns}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.lock_outline,
                color: AppColors.black,
                size: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}
