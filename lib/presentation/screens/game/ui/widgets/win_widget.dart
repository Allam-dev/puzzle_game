import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/navigation/app_navigator.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/generated/l10n.dart';

class WinWidget extends StatefulWidget {
  WinWidget({Key? key}) : super(key: key);

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
      onWillPop: () {
        AppNavigator.pop();
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
          Dialog(
            backgroundColor: AppColors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    S.of(context).complete,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Icon(
                      Icons.touch_app_outlined,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${gameCubit.steps}",
                      style: const TextStyle(fontSize: 20),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Icon(
                      Icons.timer,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${gameCubit.time} ${S.of(context).s}",
                      style: const TextStyle(fontSize: 20),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          gameCubit.restart();
                          AppNavigator.pop();
                        },
                        color: AppColors.grey300,
                        icon: const Icon(Icons.replay),
                      ),
                      GestureDetector(
                        onTap: () {
                          gameCubit.nextLevel();
                          AppNavigator.pop();
                        },
                        child: Row(
                          children: [
                            Text(S.of(context).next),
                            // Icon(Icons.next)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
