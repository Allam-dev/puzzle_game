// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/widgets/level_widget.dart';

class LevelsWidget extends StatelessWidget {
  List<Puzzle> puzzles;
  LevelsWidget({Key? key, required this.puzzles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: puzzles.length,
        itemBuilder: (context, index) {
          return LevelWidget(puzzle: puzzles[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
      ),
    );
  }
}
