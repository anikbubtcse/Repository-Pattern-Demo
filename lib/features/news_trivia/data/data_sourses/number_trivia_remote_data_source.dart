import 'dart:convert';

import 'package:repository_pattern_demo/core/constant/constants.dart';
import 'package:repository_pattern_demo/core/error/exception.dart';

import '../models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(String number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImp extends NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImp(this.client);

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(String number) async {
    final response = await client.get(
      Uri.parse(Constants.getConcreteNumberBaseUrl(number)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = NumberTriviaModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await client.get(
      Uri.parse(Constants.getRandomNumberBaseUrl()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = NumberTriviaModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw ServerException();
    }
  }
}
