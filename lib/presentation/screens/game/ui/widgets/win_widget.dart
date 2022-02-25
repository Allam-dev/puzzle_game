// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/navigation/app_navigator.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:material_dialogs/material_dialogs.dart';

class WinWidget extends StatefulWidget {
  const WinWidget({Key? key}) : super(key: key);

  @override
  State<WinWidget> createState() => _WinWidgetState();
}

class _WinWidgetState extends State<WinWidget> {
  late final GameCubit gameCubit;
  late ConfettiController confettiController;
  @override
  void initState() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    confettiController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gameCubit = getIt<GameCubit>();
    return WillPopScope(
      onWillPop: (){
        AppNavigator.pop();
        return Future.value(true);
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 30,
              confettiController: confettiController,
              colors: [
                AppColors.yellow,
                AppColors.amber,
                AppColors.orange,
              ],
            ),
          ),
          // Dialog(
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text("مبروووووك !"),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             MaterialButton(
          //               onPressed: () {
          //                 gameCubit.restart();
          //                 AppNavigator.pop();
          //               },
          //               child: const Text("play agian"),
          //             ),
          //             MaterialButton(
          //               onPressed: () {
          //                 gameCubit.nextLevel();
          //                 AppNavigator.pop();
          //               },
          //               child: const Text("next level"),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          
          
        ],
      ),
    );
  }
}
