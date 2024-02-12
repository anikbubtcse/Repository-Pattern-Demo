import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  PersonModel({required String name, required String email, required int id})
      : super(name: name, email: email, id: id);

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        name: json['name'], email: json['email'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'name': super.name, 'email': super.email, 'id': super.id};
  }
}
