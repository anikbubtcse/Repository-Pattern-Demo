part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class AddPersonEvent extends PersonEvent {
  final AddPersonParams params;

  const AddPersonEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class UpdatePersonEvent extends PersonEvent {
  final UpdatePersonParams params;

  const UpdatePersonEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class DeletePersonEvent extends PersonEvent {
  final DeletePersonParams params;

  const DeletePersonEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class GetPersonEvent extends PersonEvent {
  final NoParams params;

  const GetPersonEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
