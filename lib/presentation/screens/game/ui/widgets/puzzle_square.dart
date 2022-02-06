import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';

class PuzzleSquare extends StatelessWidget {
  int index;
  PuzzleSquare({ Key? key ,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameCubit gameCubit = BlocProvider.of<GameCubit>(context); 
    return GestureDetector(
      onTap: (){
        gameCubit.play(index);
      },
      child: Container(
        color: Colors.white,
        child: Center(child: Text("${gameCubit.puzzle.list[index]}"),),
        
      ),
    );
  }
}