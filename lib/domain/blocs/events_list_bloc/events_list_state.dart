import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/data/models/event.dart';

abstract class EventsListState extends Equatable {
  const EventsListState();

  @override
  List<Object?> get props => [];
}

class EventsListInitial extends EventsListState {}

class EventsListLoaded extends EventsListState {
  final List<Event> events;

  const EventsListLoaded({required this.events});

  EventsListLoaded copyWith({List<Event>? events}) => EventsListLoaded(
        events: events ?? this.events,
      );

  @override
  List<Object?> get props => [events];
}
