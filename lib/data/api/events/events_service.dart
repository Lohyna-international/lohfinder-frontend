import 'package:lohfinder_frontend/data/models/event.dart';

abstract class EventsService {
  Future<List<Event>> allEvents();
}
