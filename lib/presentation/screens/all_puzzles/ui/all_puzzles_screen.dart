import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_puzzles_cubit.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/widgets/puzzles_widget.dart';
import 'package:hack_puzzle/presentation/screens/screen.dart';
import 'package:hack_puzzle/presentation/widgets/snackbar_without_context.dart';

class AllPuzzlesScreen extends Screen {
  const AllPuzzlesScreen({Key? key}) : super(key: key);

  @override
  _AllPuzzlesScreenState createState() => _AllPuzzlesScreenState();

  @override
  Screen get screen => this;
}

class _AllPuzzlesScreenState extends ScreenState<AllPuzzlesScreen> {
  @override
  void initState() {
    BlocProvider.of<AllPuzzlesCubit>(context).getPuzzles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.gray,
        title: Text("Puzzles",style: TextStyle(color: AppColors.black),),
      ),
      body: BlocConsumer<AllPuzzlesCubit, AllPuzzlesState>(
        builder: (context, state) {
          if (state is AllPuzzlesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllPuzzlesError) {
            return const Center(
                child: Icon(
              Icons.error,
              size: 50,
            ));
          } else if(state is AllPuzzlesLoaded) {
            return PuzzlesWidget(puzzles: state.puzzles);
          }else{return Container();}
        },
        listener: (context, state) {
          if (state is AllPuzzlesError) {
            SnackBarWithoutContext.show(message: state.message);
          }
        },
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
