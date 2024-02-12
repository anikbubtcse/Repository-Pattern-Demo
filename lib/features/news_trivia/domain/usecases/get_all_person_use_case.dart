import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/core/usecases/usecase.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/person_repository.dart';

class GetAllPersonUseCase implements UseCase<List<PersonEntity>, NoParams> {
  final PersonRepository personRepository;

  GetAllPersonUseCase({required this.personRepository});

  @override
  Future<Either<Failure, List<PersonEntity>>> call(NoParams params) async {
    return await personRepository.getAllPerson();
  }
}

class NoParams {}
