import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/widgets/game_board_widget.dart';
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
        title: Text("${gameCubit.puzzle.columns}x${gameCubit.puzzle.rows}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                if(state is GameLoadBoard || state is GameInitial){
                  return GameBoardWidget();
                }else{
                  return Container();
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                gameCubit.reload();
              },
              child: const Icon(Icons.replay_outlined),
            )
          ],
        ),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
