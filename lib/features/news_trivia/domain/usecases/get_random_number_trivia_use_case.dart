import 'package:fpdart/fpdart.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia_entity.dart';

class GetRandomNumberTriviaUseCase {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTriviaUseCase({required this.numberTriviaRepository});

  Future<Either<Failure, NumberTriviaEntity>> execute() async {
    return await numberTriviaRepository.getRandomNumberTrivia();
  }
}
