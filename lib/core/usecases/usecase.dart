import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/error/failures.dart';

abstract class UseCase<ReturnType, Params>{
  Either<Failure,ReturnType> call(Params params);
}