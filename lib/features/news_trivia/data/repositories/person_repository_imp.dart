import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/exception.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/data_sourses/person_local_data_source.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/person_repository.dart';

import '../models/person_model.dart';

class PersonRepositoryImp extends PersonRepository {
  final PersonLocalDataSource personLocalDataSource;

  PersonRepositoryImp({required this.personLocalDataSource});

  @override
  Future<Either<Failure, int>> addPerson(PersonEntity personEntity) async {
    try {
      int value = await personLocalDataSource.addPerson(personEntity);

      return Right(value);
    } on ServerException {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    } on CacheException {
      return Left(CacheFailure(message: 'The cache file is empty.'));
    } catch (e) {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    }
  }

  @override
  Future<Either<Failure, int>> deletePerson(PersonEntity personEntity) async {
    try {
      int value = await personLocalDataSource.deletePerson(personEntity);

      return Right(value);
    } on ServerException {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    } on CacheException {
      return Left(CacheFailure(message: 'The cache file is empty.'));
    } catch (e) {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPerson() async {
    try {
      List<PersonModel> result = await personLocalDataSource.allPerson();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    } on CacheException {
      return Left(CacheFailure(message: 'The cache file is empty.'));
    } catch (e) {
      return Left(ServerFailure(message: 'Server failed.'));
    }
  }

  @override
  Future<Either<Failure, int>> updatePerson(PersonEntity personEntity) async {
    try {
      int value = await personLocalDataSource.updatePerson(personEntity);

      return Right(value);
    } on ServerException {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    } on CacheException {
      return Left(CacheFailure(message: 'The cache file is empty.'));
    } catch (e) {
      return Left(ServerFailure(message: 'Opps! Server failed.'));
    }
  }
}
