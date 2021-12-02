import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LFValidationMessage extends StatelessWidget {
  final String message;

  const LFValidationMessage(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Text(
            message,
            style: TextStyle(color: Colors.red, fontSize: 24.sp),
          ),
        ),
      );
}
