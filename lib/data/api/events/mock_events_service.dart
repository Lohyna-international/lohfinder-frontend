import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/data/models/event.dart';

import 'events_service.dart';

class MockEventsService implements EventsService {
  @override
  Future<List<Event>> allEvents() => Future.value([
        Event(
          id: 'id0',
          title: 'title0',
          description: 'description0',
          categories: const [
            Category(id: '0', title: 'Sport'),
            Category(id: '1', title: 'Music'),
            Category(id: '2', title: 'Dance'),
          ],
          address: 'address0',
          dateTime: DateTime(2021, 12, 1),
          volunteersNeeded: 100,
          volunteersJoined: 67,
          authorId: 'a0',
        ),
        Event(
          id: 'id1',
          title: 'title1',
          description: 'description1',
          categories: const [
            Category(id: '0', title: 'Sport'),
            Category(id: '2', title: 'Dance'),
          ],
          address: 'address1',
          dateTime: DateTime(2021, 12, 1),
          volunteersNeeded: 100,
          volunteersJoined: 67,
          authorId: 'a0',
        ),
        Event(
          id: 'id2',
          title: 'title2',
          description: 'description2',
          categories: const [
            Category(id: '1', title: 'Music'),
            Category(id: '2', title: 'Dance'),
          ],
          address: 'address2',
          dateTime: DateTime(2021, 12, 1),
          volunteersNeeded: 100,
          volunteersJoined: 67,
          authorId: 'a0',
        ),
      ]);
}
