import 'package:fpdart/fpdart.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';

import '../../../../core/error/failures.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPerson();

  Future<Either<Failure, int>> addPerson(PersonEntity personEntity);

  Future<Either<Failure, int>> updatePerson(PersonEntity personEntity);

  Future<Either<Failure, int>> deletePerson(PersonEntity personEntity);
}
