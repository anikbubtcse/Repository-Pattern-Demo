import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:repository_pattern_demo/features/news_trivia/data/data_sourses/number_trivia_remote_data_source.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/repositories/number_trivia_repositories_imp.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/repositories/person_repository_imp.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_add_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_all_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_concrete_number_trivia_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_delete_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_random_number_trivia_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_update_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/bloc/number_trivia_bloc/number_trivia_bloc.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/bloc/person_bloc/person_bloc.dart';

import 'features/news_trivia/data/data_sourses/person_local_data_source.dart';
import 'features/news_trivia/domain/repositories/person_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc

  locator.registerFactory(() => NumberTriviaBloc(
      getConcreteNumberTriviaUseCase: locator(),
      getRandomNumberTriviaUseCase: locator()));
  locator.registerFactory(() => PersonBloc(
      getDeletePersonUseCase: locator(),
      getUpdatePersonUseCase: locator(),
      getAddPersonUseCase: locator(),
      getAllPersonUseCase: locator()));

  //usecase

  locator.registerLazySingleton(
      () => GetConcreteNumberTriviaUseCase(numberTriviaRepository: locator()));
  locator.registerLazySingleton(
      () => GetRandomNumberTriviaUseCase(numberTriviaRepository: locator()));

  locator.registerLazySingleton(
      () => GetAddPersonUseCase(personRepository: locator()));
  locator.registerLazySingleton(
      () => GetUpdatePersonUseCase(personRepository: locator()));
  locator.registerLazySingleton(
      () => GetDeletePersonUseCase(personRepository: locator()));
  locator.registerLazySingleton(
      () => GetAllPersonUseCase(personRepository: locator()));

  //repository

  locator.registerLazySingleton<NumberTriviaRepository>(
      () => NumberTriviaRepositoryImp(numberTriviaRemoteDataSource: locator()));
  locator.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImp(personLocalDataSource: locator()));

  //datasource

  locator.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImp(locator()));

  locator.registerLazySingleton<PersonLocalDataSource>(
      () => PersonLocalDataSourceImp());

  //external

  locator.registerLazySingleton(() => http.Client());
}
