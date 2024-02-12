import 'package:fpdart/src/either.dart';
import 'package:repository_pattern_demo/core/error/failures.dart';
import 'package:repository_pattern_demo/core/usecases/usecase.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';

import '../repositories/person_repository.dart';

class GetAddPersonUseCase implements UseCase<int, AddPersonParams> {
  final PersonRepository personRepository;

  GetAddPersonUseCase({required this.personRepository});

  @override
  Future<Either<Failure, int>> call(AddPersonParams params) async {
    return await personRepository.addPerson(params);
  }
}

class AddPersonParams extends PersonEntity {
  AddPersonParams(
      {required String name, required String email, required int id})
      : super(name: name, email: email, id: id);

  Map<String, dynamic> toJson() {
    return {'name': super.name, 'email': super.email, 'id': super.id};
  }
}
