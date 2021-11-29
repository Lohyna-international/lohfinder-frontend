import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/event.dart';
import 'package:lohfinder_frontend/domain/blocs/events_list_bloc/bloc.dart';
import 'package:lohfinder_frontend/presentation/widgets/events_list_builder.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_screen_title.dart';

class EventsListScreen extends StatelessWidget {
  static const String route = '/events_list';

  const EventsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<EventsListBloc, EventsListState>(
        builder: (context, state) {
          if (state is EventsListLoaded) {
            return buildUI(events: state.events);
          }
          return Container();
        },
      );

  Widget buildUI({required List<Event> events}) => Scaffold(
        body: Column(
          children: [
            LFHeader(onMenuPressed: _onMenuPressed),
            SizedBox(height: 40.h),
            _title(),
            SizedBox(height: 40.h),
            _eventsList(events),
            SizedBox(height: 40.h),
          ],
        ),
      );

  void _onMenuPressed() {}

  Widget _title() => const LFScreenTitle('Events list');

  Widget _eventsList(List<Event> events) => Expanded(
        child: EventsListBuilder(events),
      );
}
