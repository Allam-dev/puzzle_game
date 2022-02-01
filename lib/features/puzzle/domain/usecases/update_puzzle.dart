import 'package:hack_puzzle/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/usecases/future_usecase.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/repositories/puzzle_repository.dart';

class UpdatePuzzle extends FutureUseCase<void, Puzzle> {
  final PuzzleRepository _repository;

  UpdatePuzzle({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(Puzzle params) {
    return _repository.updatePuzzle(puzzle: params);
  }
}
