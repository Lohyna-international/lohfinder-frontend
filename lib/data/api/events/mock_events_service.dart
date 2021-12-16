import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/data/models/event.dart';

import 'events_service.dart';

class MockEventsService implements EventsService {
  @override
  Future<List<Event>> allEvents() => Future.value([
        Event(
          id: 'id0',
          title: 'Toronto Maple Leafs @ Seattle Kraken',
          description: 'NHL game between Toronto Maple Leafs and Seattle Kraken.',
          categories: const [
            Category(id: '0', title: 'Sport'),
          ],
          address: 'Climate Pledge Arena at Seattle Center',
          dateTime: DateTime(2021, 12, 19),
          volunteersNeeded: 100,
          volunteersJoined: 67,
          authorId: 'a0',
          imageUrl: 'https://climatepledgearena.com/wp-content/uploads/2021/07/Toronto-Maple-Leafs.jpg',
        ),
        Event(
          id: 'id1',
          title: 'Tomorrowland',
          description: 'Still the one to beat after more than a decade in the '
              'game, the Belgian behemoth is the leading light for Europe’s '
              'electronic music festival scene. Famed for its awe-inspiring '
              'production, stage design, lighting, visuals and all-encompassing '
              'mythology, it has become something of a pilgrimage for dance '
              'music fans the world over.',
          categories: const [
            Category(id: '1', title: 'Music'),
            Category(id: '2', title: 'Dance'),
          ],
          address: 'Boom, Belgium',
          dateTime: DateTime(2022, 7, 22),
          volunteersNeeded: 200,
          volunteersJoined: 54,
          authorId: 'a0',
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Tomorrowland-2017-2.jpg/1920px-Tomorrowland-2017-2.jpg',
        ),
      ]);
}
