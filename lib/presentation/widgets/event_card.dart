import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/event.dart';
import 'package:lohfinder_frontend/presentation/helpers/date_time_extension.dart';
import 'package:lohfinder_frontend/presentation/screens/event_info/event_info_screen.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

import 'categories_tags.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 1465.w,
        height: 373.h,
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        decoration: _decoration(),
        child: Row(
          children: [
            _image(),
            SizedBox(width: 80.w),
            _info(context),
          ],
        ),
      );

  Decoration _decoration() => BoxDecoration(
        border: Border.all(color: LFColors.primary, width: 2.r),
        borderRadius: BorderRadius.circular(10.r),
      );

  //TODO should be actually image
  Widget _image() => Container(
        width: 343.w,
        height: 198.h,
        color: LFColors.secondaryDark,
      );

  Widget _info(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _title(),
            SizedBox(height: 16.h),
            CategoriesTags(event.categories),
            SizedBox(height: 16.h),
            _infoSection(event.address),
            SizedBox(height: 16.h),
            _infoSection(event.dateTime.toDottedString()),
            SizedBox(height: 16.h),
            _infoSection(
              'Volunteers: ${event.volunteersJoined}/${event.volunteersNeeded}',
            ),
            SizedBox(height: 24.h),
            _viewMore(context),
          ],
        ),
      );

  Widget _title() => Align(
        alignment: Alignment.center,
        child: Text(
          event.title,
          style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
        ),
      );

  Widget _infoSection(String text) => Text(
        text,
        style: TextStyle(fontSize: 24.sp),
      );

  Widget _viewMore(BuildContext context) => InkWell(
        onTap: () => _onViewMoreTap(context),
        child: Text(
          'View more',
          style: TextStyle(
            color: LFColors.primaryDark,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      );

  void _onViewMoreTap(BuildContext context) {
    Navigator.pushNamed(context, EventInfoScreen.route, arguments: event);
  }
}
