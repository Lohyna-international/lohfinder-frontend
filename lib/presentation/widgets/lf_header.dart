import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_menu.dart';

class LFHeader extends StatelessWidget {
  final bool showMenuButton;

  const LFHeader({Key? key, this.showMenuButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        height: 180.h,
        width: double.infinity,
        color: LFColors.primaryLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            if (showMenuButton) ...[
              const Spacer(),
              const LFMenu(),
            ],
          ],
        ),
      );

  Widget _title() => Text(
        'Lohfinder',
        style: TextStyle(
          fontSize: 72.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}
