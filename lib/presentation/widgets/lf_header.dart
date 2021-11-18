import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFHeader extends StatelessWidget {
  const LFHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 180.h,
        width: double.infinity,
        color: LFColors.primaryLight,
        child: Text(
          'Lohfinder',
          style: TextStyle(
            fontSize: 72.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
