import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/person_model.dart';
import '../../../domain/entities/number_trivia_entity.dart';
import '../../../domain/usecases/get_concrete_number_trivia_use_case.dart';
import '../../../domain/usecases/get_random_number_trivia_use_case.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTriviaUseCase getConcreteNumberTriviaUseCase;
  final GetRandomNumberTriviaUseCase getRandomNumberTriviaUseCase;

  NumberTriviaBloc(
      {required this.getConcreteNumberTriviaUseCase,
      required this.getRandomNumberTriviaUseCase})
      : super(NumberTriviaInitial()) {
    on<GetConcreteNumberTriviaEvent>(_onGetConcreteNumberTriviaEvent);

    on<GetRandomNumberTriviaEvent>(_onGetRandomNumberTriviaEvent);
  }

  _onGetConcreteNumberTriviaEvent(GetConcreteNumberTriviaEvent event,
      Emitter<NumberTriviaState> state) async {
    emit(NumberTriviaLoading());

    final result = await getConcreteNumberTriviaUseCase.execute(event.number);

    result.fold((l) {
      emit(NumberTriviaError(message: l.message));
    }, (r) {
      emit(NumberTriviaConcreteLoaded(result: r));
    });
  }

  _onGetRandomNumberTriviaEvent(GetRandomNumberTriviaEvent event,
      Emitter<NumberTriviaState> state) async {
    emit(NumberTriviaLoading());

    final result = await getRandomNumberTriviaUseCase.execute();

    result.fold((l) {
      emit(NumberTriviaError(message: l.message));
    }, (r) {
      emit(NumberTriviaRandomLoaded(result: r));
    });
  }
}
