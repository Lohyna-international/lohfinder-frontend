import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/screens/create_event/create_event_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/welcome/welcome_screen.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFMenu extends StatelessWidget {
  const LFMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: _itemBuilder,
        tooltip: '',
        offset: Offset(0, 64.h),
        child: Icon(Icons.menu, size: 64.r, color: LFColors.textPrimary),
        padding: EdgeInsets.all(8.r),
        shape: _shape(),
      );

  List<PopupMenuEntry> _itemBuilder(BuildContext context) => <PopupMenuEntry>[
        _item('Edit profile', onTap: () {}),
        _divider(),
        _item('My events', onTap: () {}),
        _divider(),

        //TODO only for organizers
        _item('Create event', onTap: () => _createEvent(context)),
        _divider(),

        _item('Sign out', onTap: () => _signOut(context)),
      ];

  PopupMenuEntry _item(String title, {required void Function() onTap}) =>
      PopupMenuItem(
        onTap: () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            onTap.call();
          });
        },
        child: Text(title, style: TextStyle(fontSize: 32.sp)),
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
      );

  PopupMenuEntry _divider() => PopupMenuDivider(height: 16.h);

  ShapeBorder _shape() => RoundedRectangleBorder(
        side: BorderSide(color: LFColors.primaryDark, width: 3.r),
        borderRadius: BorderRadius.circular(10.r),
      );

  void _signOut(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomeScreen.route,
      (route) => false,
    );
  }

  void _createEvent(BuildContext context) {
    Navigator.pushNamed(context, CreateEventScreen.route);
  }
}
