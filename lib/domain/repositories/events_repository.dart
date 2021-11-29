import 'package:lohfinder_frontend/data/api/events/events_service.dart';
import 'package:lohfinder_frontend/data/models/event.dart';

class EventsRepository {
  final EventsService _service;

  EventsRepository(this._service);

  Future<List<Event>> allEvents() => _service.allEvents();
}
