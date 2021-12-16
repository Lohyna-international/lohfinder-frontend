import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/data/models/event.dart';
import 'package:lohfinder_frontend/domain/repositories/events_repository.dart';

import 'events_list_event.dart';
import 'events_list_state.dart';

class EventsListBloc extends Bloc<EventsListEvent, EventsListState> {
  final EventsRepository _repository;

  EventsListBloc(this._repository) : super(EventsListInitial()) {
    on<LoadEvents>(_onLoadEvents);
  }

  FutureOr<void> _onLoadEvents(
    LoadEvents event,
    Emitter<EventsListState> emit,
  ) async {
    final List<Event> events = await _repository.allEvents();
    return emit(EventsListLoaded(events: events));
  }
}
