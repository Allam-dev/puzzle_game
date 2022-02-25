
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/paths/animation_path.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/crash_wiget.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/game_body.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/win_widget.dart';
import 'package:hack_puzzle/presentation/screens/screen.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class GameScreen extends Screen {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();

  @override
  Screen get screen => this;
}

class _GameScreenState extends ScreenState<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameCubit>(
      create: (context) => getIt<GameCubit>(),
      child: BlocConsumer<GameCubit, GameState>(
        builder: (context, state) {
          if (state is GameCrash) {
            return CrashWidget();
          } else {
            return GameBody();
          }
        },
        listener: (context, state) {
          if (state is GameWin) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return WinWidget();
                });

            // AwesomeDialog(
            //   context: context,
            //   dialogType: DialogType.SUCCES,
            //   animType: AnimType.BOTTOMSLIDE,
            //   title: 'Dialog Title',
            //   desc: 'Dialog description here.............',
            //   btnCancelOnPress: () {},
            //   btnOkOnPress: () {},
            // ).show();

            // Dialogs.materialDialog(
            //     color: Colors.white,
            //     // msg: 'Congratulations, you won 500 points',
            //     title: 'Congratulations',
            //     barrierDismissible: false,
            //     lottieBuilder: Lottie.asset(AnimationPath.get(fileName: "success_batch")),
            //     context: context,
            //     actions: [
            //       IconsButton(
            //         onPressed: () {},
            //         text: 'Claim',
            //         iconData: Icons.done,
            //         color: Colors.blue,
            //         textStyle: TextStyle(color: Colors.white),
            //         iconColor: Colors.white,
            //       ),
            //       IconsButton(
            //         onPressed: () {},
            //         text: 'Claim',
            //         iconData: Icons.done,
            //         color: Colors.blue,
            //         textStyle: TextStyle(color: Colors.white),
            //         iconColor: Colors.white,
            //       ),
            //     ]);
          }
        },
      ),
    );
  }

  @override
  String get routeName => widget.toString();
  @override
  Future<void> dispose() async {
    super.dispose();
    getIt.unregister<GameCubit>();
  }
}
