import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/error/failures.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';


abstract class PuzzleRepository{
  Future<Either<Failure,List<Puzzle>>> getAllPuzzles();
  Future<Either<Failure,void>> updatePuzzle({required Puzzle puzzle});
}