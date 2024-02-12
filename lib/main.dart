import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/bloc/person_bloc/person_bloc.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/pages/local_database_page.dart';
import 'dependency_container.dart';
import 'features/news_trivia/presentation/bloc/number_trivia_bloc/number_trivia_bloc.dart';
import 'features/news_trivia/presentation/pages/number_trivia_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<NumberTriviaBloc>()),
        BlocProvider(create: (_) => locator<PersonBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: NumberTriviaPage.numberTriviaPage,
        routes: {
          NumberTriviaPage.numberTriviaPage: (context) => NumberTriviaPage(),
          LocalDatabasePage.localDatabasePage: (context) => LocalDatabasePage(),
        },
      ),
    );
  }
}
