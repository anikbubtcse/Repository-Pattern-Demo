import 'package:repository_pattern_demo/features/news_trivia/domain/entities/number_trivia_entity.dart';

class NumberTriviaModel extends NumberTriviaEntity {
  const NumberTriviaModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      NumberTriviaModel(text: json["text"] ?? '', number: json["number"] ?? 0);

  Map toJson() {
    final Map map = {};

    map["text"] = text;
    map["number"] = number;

    return map;
  }
}
