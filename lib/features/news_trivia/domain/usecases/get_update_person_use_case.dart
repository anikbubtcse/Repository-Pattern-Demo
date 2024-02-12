import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/core/usecases/usecase.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/person_repository.dart';

import '../entities/person_entity.dart';

class GetUpdatePersonUseCase implements UseCase<int, UpdatePersonParams> {
  final PersonRepository personRepository;

  GetUpdatePersonUseCase({required this.personRepository});

  @override
  Future<Either<Failure, int>> call(UpdatePersonParams params) async {
    return await personRepository.updatePerson(params);
  }
}

class UpdatePersonParams extends PersonEntity {
  UpdatePersonParams(
      {required String name, required String email, required int id})
      : super(name: name, email: email, id: id);

  Map<String, dynamic> toJson() {
    return {'name': super.name, 'email': super.email, 'id': super.id};
  }
}
