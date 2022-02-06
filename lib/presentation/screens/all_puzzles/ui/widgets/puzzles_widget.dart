import 'package:flutter/material.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/widgets/puzzle_widget.dart';

class PuzzlesWidget extends StatelessWidget {
  List<Puzzle> puzzles;
  PuzzlesWidget({Key? key, required this.puzzles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: puzzles.length,
        itemBuilder: (context, index) {
          return PuzzleWidget(puzzle: puzzles[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15,
          );
        },
      ),
    );
  }
}
