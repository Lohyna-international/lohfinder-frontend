import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/domain/validation/date_validation.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';
import 'package:lohfinder_frontend/domain/validation/volunteers_validation.dart';

import 'create_event_event.dart';
import 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final Validation _dateValidation = DateValidation();
  final Validation _volunteersValidation = VolunteersValidation();

  CreateEventBloc() : super(const CreateEventInitial()) {
    on<RequiredFieldChanged>(_onRequiredFieldChanged);
    on<DateChanged>(_onDateChanged);
    on<VolunteersChanged>(_onVolunteersChanged);
  }

  FutureOr<void> _onRequiredFieldChanged(
    RequiredFieldChanged event,
    Emitter<CreateEventState> emit,
  ) {
    final currentState = state;
    if (currentState is CreateEventInitial) {
      emit(currentState.copyWith());
    }
  }

  FutureOr<void> _onDateChanged(
    DateChanged event,
    Emitter<CreateEventState> emit,
  ) {
    final currentState = state;
    if (currentState is CreateEventInitial) {
      emit(
        currentState.copyWith(
          dateValidation: _dateValidation.validate(event.date),
        ),
      );
    }
  }

  FutureOr<void> _onVolunteersChanged(
    VolunteersChanged event,
    Emitter<CreateEventState> emit,
  ) {
    final currentState = state;
    if (currentState is CreateEventInitial) {
      emit(
        currentState.copyWith(
          volunteersValidation: _volunteersValidation.validate(
            event.volunteers,
          ),
        ),
      );
    }
  }

  bool enableButton({
    required String title,
    required String address,
    required String date,
    required String volunteers,
  }) {
    final currentState = state;
    if (currentState is CreateEventInitial) {
      return _allValid(currentState) &&
          _requiredNotEmpty(
            title,
            address,
            date,
            volunteers,
          );
    }
    return false;
  }

  bool _allValid(CreateEventInitial currentState) =>
      currentState.dateValidation.isValid &&
      currentState.volunteersValidation.isValid;

  bool _requiredNotEmpty(
    String title,
    String address,
    String date,
    String volunteers,
  ) {
    List<String> fields = [title, address, date, volunteers];
    return fields.every((element) => element.isNotEmpty);
  }
}
