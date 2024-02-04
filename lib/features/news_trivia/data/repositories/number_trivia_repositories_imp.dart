import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/exception.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/data_sourses/number_trivia_remote_data_source.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/number_trivia_entity.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImp extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;

  NumberTriviaRepositoryImp({required this.numberTriviaRemoteDataSource});

  @override
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      String number) async {
    try {
      final result =
          await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Server failed ..."));
    }
  }

  @override
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia() async {
    try {
      final result = await numberTriviaRemoteDataSource.getRandomNumberTrivia();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Server failed ..."));
    }
  }
}
