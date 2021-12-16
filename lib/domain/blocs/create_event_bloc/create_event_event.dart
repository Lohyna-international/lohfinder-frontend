import 'package:equatable/equatable.dart';

abstract class CreateEventEvent extends Equatable {
  const CreateEventEvent();

  @override
  List<Object?> get props => [];
}

class RequiredFieldChanged extends CreateEventEvent {}

class DateChanged extends CreateEventEvent {
  final String date;

  const DateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class VolunteersChanged extends CreateEventEvent {
  final String volunteers;

  const VolunteersChanged(this.volunteers);

  @override
  List<Object?> get props => [volunteers];
}
