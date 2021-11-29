import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LFSectionTitle extends StatelessWidget {
  final String title;

  const LFSectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
      );
}
