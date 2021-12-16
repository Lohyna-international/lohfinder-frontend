import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/event.dart';
import 'package:lohfinder_frontend/presentation/helpers/date_time_extension.dart';
import 'package:lohfinder_frontend/presentation/widgets/categories_tags.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_screen_title.dart';

import 'local_widgets/info_section.dart';

class EventInfoScreen extends StatelessWidget {
  static const String route = '/event_info';
  final Event event;

  const EventInfoScreen(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => buildUI(context);

  Widget buildUI(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LFHeader(showMenuButton: true, showBackButton: true),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 413.w),
                child: _content(context),
              ),
            ],
          ),
        ),
      );

  Widget _content(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 35.h),
          _title(),
          SizedBox(height: 35.h),
          _image(),
          SizedBox(height: 35.h),
          InfoSection(title: 'Description', text: event.description),
          InfoSection(title: 'Address', text: event.address),
          InfoSection(title: 'Date', text: event.dateTime.toDottedString()),
          InfoSection(
            title: 'Volunteers (joined/needed)',
            text: '${event.volunteersJoined}/${event.volunteersNeeded}',
          ),
          InfoSection(
            title: 'Categories',
            infoWidget: CategoriesTags(event.categories),
          ),
          SizedBox(height: 40.h),
          _joinButton(context),
          SizedBox(height: 50.h),
        ],
      );

  Widget _title() => Align(
        alignment: Alignment.center,
        child: LFScreenTitle(event.title),
      );

  Widget _image() => Image.network(
        event.imageUrl,
        width: 1093.w,
        height: 426.h,
      );

  Widget _joinButton(BuildContext context) => Align(
        alignment: Alignment.center,
        child: LFButton(onPressed: () => _joinEvent(context), text: 'Join'),
      );

  void _joinEvent(BuildContext context) {
    Navigator.pop(context);
  }
}
