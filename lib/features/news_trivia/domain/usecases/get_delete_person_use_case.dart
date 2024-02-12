import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/core/usecases/usecase.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/person_repository.dart';

class GetDeletePersonUseCase implements UseCase<int, DeletePersonParams> {
  final PersonRepository personRepository;

  GetDeletePersonUseCase({required this.personRepository});

  @override
  Future<Either<Failure, int>> call(DeletePersonParams params) async {
    return await personRepository.deletePerson(params);
  }
}

class DeletePersonParams extends PersonEntity {
  DeletePersonParams({required String name, required String email, required int id})
      : super(name: name, email: email, id: id);

  Map<String, dynamic> toJson() {
    return {'name': super.name, 'email': super.email, 'id': super.id};
  }
}
