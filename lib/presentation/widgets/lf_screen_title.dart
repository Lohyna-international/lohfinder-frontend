import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LFScreenTitle extends StatelessWidget {
  final String title;

  const LFScreenTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w500),
      );
}
