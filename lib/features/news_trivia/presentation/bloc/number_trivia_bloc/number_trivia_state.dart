part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class NumberTriviaLoading extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class NumberTriviaConcreteLoaded extends NumberTriviaState {
  final NumberTriviaEntity result;

  const NumberTriviaConcreteLoaded({required this.result});

  @override
  List<Object> get props => [result];
}

class NumberTriviaRandomLoaded extends NumberTriviaState {
  final NumberTriviaEntity result;

  const NumberTriviaRandomLoaded({required this.result});

  @override
  List<Object> get props => [result];
}

class NumberTriviaError extends NumberTriviaState {
  final String message;

  const NumberTriviaError({required this.message});

  @override
  List<Object> get props => [message];
}
