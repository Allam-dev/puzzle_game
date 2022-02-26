import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/crash_wiget.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/finish_game_dialog.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/game_body.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/win_widget.dart';
import 'package:hack_puzzle/presentation/screens/screen.dart';

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
                  return WinDialog();
                });
          } else if (state is GameFinishAll) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return FinishGameDialog();
                });
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
