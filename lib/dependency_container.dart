import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:repository_pattern_demo/features/news_trivia/data/data_sourses/number_trivia_remote_data_source.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/repositories/number_trivia_repositories_imp.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_concrete_number_trivia_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_random_number_trivia_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/bloc/number_trivia_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc

  locator.registerFactory(() => NumberTriviaBloc(
      getConcreteNumberTriviaUseCase: locator(),
      getRandomNumberTriviaUseCase: locator()));

  //usecase

  locator.registerLazySingleton(
      () => GetConcreteNumberTriviaUseCase(numberTriviaRepository: locator()));
  locator.registerLazySingleton(
      () => GetRandomNumberTriviaUseCase(numberTriviaRepository: locator()));

  //repository

  locator.registerLazySingleton<NumberTriviaRepository>(
      () => NumberTriviaRepositoryImp(numberTriviaRemoteDataSource: locator()));

  //datasource

  locator.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImp(locator()));

  //external

  locator.registerLazySingleton(() => http.Client());
}
