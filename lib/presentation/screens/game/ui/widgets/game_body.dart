// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';

import 'game_board_widget.dart';

class GameBody extends StatefulWidget {
  const GameBody({Key? key}) : super(key: key);

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late final GameCubit gameCubit;
  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("${gameCubit.puzzle.columns} x ${gameCubit.puzzle.columns}"),
        actions: [
          IconButton(
              onPressed: () {
                gameCubit.restart();
              },
              icon: const Icon(Icons.replay_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    // Text(
                    //   "steps",
                    //   style: TextStyle(fontSize: 25),
                    // ),
                    Icon(Icons.touch_app_outlined,size: 40,),
                    Text(
                      "${gameCubit.steps}",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Column(
                  children: [
                    // const Text(
                    //   "time",
                    //   style: TextStyle(fontSize: 25),
                    // ),
                    Icon(Icons.timer,size: 35,),
                    Text(
                      "${gameCubit.time} s",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            GameBoardWidget(),
            const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          gameCubit.emit(GameWin());
        },
      ),
    );
  }
}
