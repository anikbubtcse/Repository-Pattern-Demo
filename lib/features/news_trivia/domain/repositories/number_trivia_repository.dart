import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia_entity.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      String number);

  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia();
}
