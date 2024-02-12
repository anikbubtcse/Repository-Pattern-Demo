import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_all_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_delete_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_update_person_use_case.dart';

import '../../../domain/entities/person_entity.dart';
import '../../../domain/usecases/get_add_person_use_case.dart';

part 'person_event.dart';

part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetAllPersonUseCase getAllPersonUseCase;
  final GetAddPersonUseCase getAddPersonUseCase;
  final GetUpdatePersonUseCase getUpdatePersonUseCase;
  final GetDeletePersonUseCase getDeletePersonUseCase;

  PersonBloc(
      {required this.getDeletePersonUseCase,
      required this.getUpdatePersonUseCase,
      required this.getAddPersonUseCase,
      required this.getAllPersonUseCase})
      : super(PersonInitial()) {
    on<AddPersonEvent>(_onAddPersonEvent);
    on<UpdatePersonEvent>(_onUpdatePersonEvent);
    on<DeletePersonEvent>(_onDeletePersonEvent);
    on<GetPersonEvent>(_onGetPersonEvent);
  }

  _onAddPersonEvent(
      AddPersonEvent event, Emitter<PersonState> personState) async {
    emit(PersonLoading());

    final result = await getAddPersonUseCase.call(event.params);
    result.fold((l) {
      emit(PersonError(message: l.message));
    }, (r) => {emit(PersonAddLoaded(value: r))});
  }

  _onUpdatePersonEvent(
      UpdatePersonEvent event, Emitter<PersonState> personState) async {
    emit(PersonLoading());

    final result = await getUpdatePersonUseCase.call(event.params);
    result.fold((l) {
      emit(PersonError(message: l.message));
    }, (r) {
      emit(PersonUpdateLoaded(value: r));
    });
  }

  _onDeletePersonEvent(
      DeletePersonEvent event, Emitter<PersonState> personState) async {
    emit(PersonLoading());

    final result = await getDeletePersonUseCase.call(event.params);
    result.fold((l) {
      emit(PersonError(message: l.message));
    }, (r) {
      emit(PersonDeleteLoaded(value: r));
    });
  }

  _onGetPersonEvent(
      GetPersonEvent event, Emitter<PersonState> personState) async {
    emit(PersonLoading());

    final result = await getAllPersonUseCase.call(event.params);
    result.fold((l) {
      emit(PersonError(message: l.message));
    }, (r) {
      emit(PersonGetLoaded(person: r));
    });
  }
}
