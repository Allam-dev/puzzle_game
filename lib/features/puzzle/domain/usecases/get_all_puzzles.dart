import 'package:hack_puzzle/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/usecases/future_usecase.dart';
import 'package:hack_puzzle/core/usecases/no_params.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/repositories/puzzle_repository.dart';



class GetAllPuzzles extends FutureUseCase<List<Puzzle>, NoParams> {
  final PuzzleRepository _repository;

  GetAllPuzzles({required PuzzleRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Puzzle>>> call(NoParams params) {
    return _repository.getAllPuzzles();
  }
}
