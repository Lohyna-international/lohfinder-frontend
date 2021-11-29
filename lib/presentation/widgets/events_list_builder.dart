import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/event.dart';

import 'event_card.dart';

class EventsListBuilder extends StatelessWidget {
  final List<Event> events;

  const EventsListBuilder(this.events, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => EventCard(events[index]),
        separatorBuilder: (context, index) => SizedBox(height: 50.h),
        itemCount: events.length,
        padding: EdgeInsets.symmetric(horizontal: 227.w),
      );
}
