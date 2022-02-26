import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/ui/widgets/levels_widget.dart';
import 'package:hack_puzzle/presentation/screens/screen.dart';
import 'package:hack_puzzle/presentation/widgets/snackbar_without_context.dart';
import 'package:hack_puzzle/generated/l10n.dart';

class AllLevelsScreen extends Screen {
  const AllLevelsScreen({Key? key}) : super(key: key);

  @override
  _AllPuzzlesScreenState createState() => _AllPuzzlesScreenState();

  @override
  Screen get screen => this;
}

class _AllPuzzlesScreenState extends ScreenState<AllLevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllLevelsCubit>(
      create: (context) => getIt<AllLevelsCubit>(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.grey100,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              S.of(context).puzzles,
            ),
            actions: [
              PopupMenuButton(
                  icon: const Icon(Icons.language),
                  itemBuilder: (context) => List.generate(
                      S.delegate.supportedLocales.length,
                      (index) => PopupMenuItem(
                          onTap: () async {
                            BlocProvider.of<AllLevelsCubit>(context)
                                .setLanguage(Locale(S.delegate
                                    .supportedLocales[index].languageCode));
                          },
                          child: Text(S
                              .delegate.supportedLocales[index].languageCode))))
            ],
          ),
          body: BlocConsumer<AllLevelsCubit, AllLevelsState>(
            builder: (context, state) {
              if (state is AllLevelsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AllLevelsError) {
                return const Center(
                    child: Icon(
                  Icons.error,
                  size: 50,
                ));
              } else if (state is AllLevelsLoaded) {
                return LevelsWidget(puzzles: state.puzzles);
              } else {
                return Container();
              }
            },
            listener: (context, state) {
              if (state is AllLevelsError) {
                SnackBarWithoutContext.show(message: state.message);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
