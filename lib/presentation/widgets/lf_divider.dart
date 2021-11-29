import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFDivider extends StatelessWidget {
  const LFDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 2.h,
        color: LFColors.primaryDark,
      );
}
