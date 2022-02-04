import 'package:hack_puzzle/core/error/exceptions.dart';
import 'package:hack_puzzle/core/error/failures.dart';
import 'package:hack_puzzle/features/puzzle/data/data_sources/local/puzzle_local_data_source.dart';
import 'package:hack_puzzle/features/puzzle/data/models/puzzle_model.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/features/puzzle/domain/repositories/puzzle_repository.dart';

class PuzzleReposetoryImpl implements PuzzleRepository {
  final PuzzleLocalDataSource localDataSource;

  PuzzleReposetoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<Puzzle>>> getAllPuzzles() async {
    try {
      bool isTabelExisting = await localDataSource.isPuzzlesTabelExisting();
      if (isTabelExisting == true) {
        return Right(await localDataSource.getAllPuzzles());
      } else {
        await localDataSource.createPuzzleTable();
        return Right(await localDataSource.getAllPuzzles());
      }
    } on CreateTableException {
      return Left(CreateTableFailure());
    } on QueryException {
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePuzzle({required Puzzle puzzle}) async {
    PuzzleModel puzzleModel = PuzzleModel(
        id: puzzle.id,
        columns: puzzle.columns,
        rows: puzzle.rows,
        steps: puzzle.steps,
        timeBySec: puzzle.timeBySec,
        isOpen: puzzle.isOpen);
    try {
      final update = await localDataSource.updatePuzzle(
          id: puzzle.id, values: puzzleModel.toJson);
      return Right(update);
    } on UpdateTableException {
      return Left(UpdateTableFailure());
    }
  }
}
