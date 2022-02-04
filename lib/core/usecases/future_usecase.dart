import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/error/failures.dart';

abstract class FutureUseCase<ReturnType, Params>{
  Future<Either<Failure,ReturnType>> call(Params params);
}