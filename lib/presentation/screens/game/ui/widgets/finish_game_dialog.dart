import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/navigation/app_navigator.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/generated/l10n.dart';

class FinishGameDialog extends StatefulWidget {
  FinishGameDialog({Key? key}) : super(key: key);

  @override
  State<FinishGameDialog> createState() => _FinishGameDialogState();
}

class _FinishGameDialogState extends State<FinishGameDialog> {
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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.amber,
                          shadows: [
                            Shadow(
                              blurRadius: 7.0,
                              color: AppColors.amber,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FlickerAnimatedText(S.of(context).finished),
                          ],
                        ),
                      ),
                    ),
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
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            AppNavigator.pop();
                            AppNavigator.pop();
                          },
                          color: AppColors.amber,
                          child: Text(S.of(context).ok),
                        ),
                      ),
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
